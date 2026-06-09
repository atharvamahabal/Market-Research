import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_helper.g.dart';

@Riverpod(keepAlive: true)
DatabaseHelper databaseHelper(DatabaseHelperRef ref) {
  return DatabaseHelper();
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'market_research.db');
    return await openDatabase(
      path,
      version: 4, // Increment version for schema changes
      onUpgrade: _onUpgrade,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id TEXT PRIMARY KEY,
        email TEXT UNIQUE NOT NULL,
        name TEXT NOT NULL,
        google_id TEXT UNIQUE NOT NULL,
        initial_capital REAL DEFAULT 100000.0,
        available_balance REAL DEFAULT 100000.0,
        created_at INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE portfolios (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        name TEXT NOT NULL,
        total_value REAL DEFAULT 0.0,
        unrealized_pnl REAL DEFAULT 0.0,
        realized_pnl REAL DEFAULT 0.0,
        created_at INTEGER,
        FOREIGN KEY (user_id) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE holdings (
        id TEXT PRIMARY KEY,
        portfolio_id TEXT NOT NULL,
        symbol TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        avg_buy_price REAL NOT NULL,
        current_price REAL DEFAULT 0.0,
        invested_amount REAL NOT NULL,
        current_value REAL DEFAULT 0.0,
        unrealized_pnl REAL DEFAULT 0.0,
        last_updated INTEGER,
        FOREIGN KEY (portfolio_id) REFERENCES portfolios(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE transactions (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        symbol TEXT NOT NULL,
        transaction_type TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        price REAL NOT NULL,
        total_amount REAL NOT NULL,
        timestamp INTEGER,
        FOREIGN KEY (user_id) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE strategies (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        name TEXT NOT NULL,
        type TEXT NOT NULL,
        conditions TEXT NOT NULL,
        stop_loss_percentage REAL NOT NULL,
        target_1_percentage REAL NOT NULL,
        is_active INTEGER DEFAULT 1,
        created_at INTEGER,
        FOREIGN KEY (user_id) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE backtest_results (
        id TEXT PRIMARY KEY,
        strategy_id TEXT NOT NULL,
        symbol TEXT NOT NULL,
        start_date INTEGER NOT NULL,
        end_date INTEGER NOT NULL,
        total_trades INTEGER NOT NULL,
        winning_trades INTEGER NOT NULL,
        win_ratio REAL NOT NULL,
        max_drawdown REAL NOT NULL,
        net_pnl REAL NOT NULL,
        tested_at INTEGER,
        FOREIGN KEY (strategy_id) REFERENCES strategies(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE watchlist (
        symbol TEXT PRIMARY KEY,
        added_at INTEGER
      )
    ''');

    // Seed initial watchlist
    final initialWatchlist = ['^NSEI', '^NSEBANK', 'RELIANCE.NS', 'TCS.NS', 'INFY.NS'];
    for (final symbol in initialWatchlist) {
      await db.insert('watchlist', {
        'symbol': symbol,
        'added_at': DateTime.now().millisecondsSinceEpoch,
      });
    }

    // Seed a default user for paper trading
    await db.insert('users', {
      'id': 'default_user',
      'email': 'user@example.com',
      'name': 'Trader',
      'google_id': 'default',
      'initial_capital': 100000.0,
      'available_balance': 100000.0,
      'created_at': DateTime.now().millisecondsSinceEpoch,
    });

    // Seed a default portfolio
    await db.insert('portfolios', {
      'id': 'default_portfolio',
      'user_id': 'default_user',
      'name': 'My Portfolio',
      'created_at': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE strategies (
          id TEXT PRIMARY KEY,
          user_id TEXT NOT NULL,
          name TEXT NOT NULL,
          type TEXT NOT NULL,
          conditions TEXT NOT NULL,
          stop_loss_percentage REAL NOT NULL,
          target_1_percentage REAL NOT NULL,
          is_active INTEGER DEFAULT 1,
          created_at INTEGER,
          FOREIGN KEY (user_id) REFERENCES users(id)
        )
      ''');
    }
    if (oldVersion < 3) {
      await db.execute('''
        CREATE TABLE backtest_results (
          id TEXT PRIMARY KEY,
          strategy_id TEXT NOT NULL,
          symbol TEXT NOT NULL,
          start_date INTEGER NOT NULL,
          end_date INTEGER NOT NULL,
          total_trades INTEGER NOT NULL,
          winning_trades INTEGER NOT NULL,
          win_ratio REAL NOT NULL,
          max_drawdown REAL NOT NULL,
          net_pnl REAL NOT NULL,
          tested_at INTEGER,
          FOREIGN KEY (strategy_id) REFERENCES strategies(id)
        )
      ''');
    }
    if (oldVersion < 4) {
      await db.execute('''
        CREATE TABLE watchlist (
          symbol TEXT PRIMARY KEY,
          added_at INTEGER
        )
      ''');
      // Seed initial watchlist
      final initialWatchlist = ['^NSEI', '^NSEBANK', 'RELIANCE.NS', 'TCS.NS', 'INFY.NS'];
      for (final symbol in initialWatchlist) {
        await db.insert('watchlist', {
          'symbol': symbol,
          'added_at': DateTime.now().millisecondsSinceEpoch,
        });
      }
    }
  }

  // Transaction Methods

  Future<Map<String, dynamic>?> getUser(String userId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<void> buyStock(String userId, String portfolioId, String symbol,
      int quantity, double price) async {
    final db = await database;
    final totalAmount = quantity * price;

    await db.transaction((txn) async {
      // 1. Check Balance
      final List<Map<String, dynamic>> userMaps = await txn.query(
        'users',
        where: 'id = ?',
        whereArgs: [userId],
      );

      if (userMaps.isEmpty) throw Exception('User not found');
      final user = userMaps.first;
      final currentBalance = user['available_balance'] as double;

      if (currentBalance < totalAmount) {
        throw Exception('Insufficient balance');
      }

      // 2. Deduct Balance
      await txn.update(
        'users',
        {'available_balance': currentBalance - totalAmount},
        where: 'id = ?',
        whereArgs: [userId],
      );

      // 3. Update/Create Holding
      final List<Map<String, dynamic>> holdingMaps = await txn.query(
        'holdings',
        where: 'portfolio_id = ? AND symbol = ?',
        whereArgs: [portfolioId, symbol],
      );

      if (holdingMaps.isNotEmpty) {
        final holding = holdingMaps.first;
        final currentQty = holding['quantity'] as int;
        final currentInvested = holding['invested_amount'] as double;

        final newQty = currentQty + quantity;
        final newInvested = currentInvested + totalAmount;
        final newAvgPrice = newInvested / newQty;

        await txn.update(
          'holdings',
          {
            'quantity': newQty,
            'invested_amount': newInvested,
            'avg_buy_price': newAvgPrice,
            'current_price': price,
            'current_value': newQty * price,
            'last_updated': DateTime.now().millisecondsSinceEpoch,
          },
          where: 'id = ?',
          whereArgs: [holding['id']],
        );
      } else {
        await txn.insert('holdings', {
          'id': '${portfolioId}_$symbol',
          'portfolio_id': portfolioId,
          'symbol': symbol,
          'quantity': quantity,
          'avg_buy_price': price,
          'current_price': price,
          'invested_amount': totalAmount,
          'current_value': totalAmount,
          'unrealized_pnl': 0.0,
          'last_updated': DateTime.now().millisecondsSinceEpoch,
        });
      }

      // 4. Record Transaction
      await txn.insert('transactions', {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'user_id': userId,
        'symbol': symbol,
        'transaction_type': 'BUY',
        'quantity': quantity,
        'price': price,
        'total_amount': totalAmount,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });
    });
  }

  Future<List<Map<String, dynamic>>> getHoldings(String portfolioId) async {
    final db = await database;
    return await db.query(
      'holdings',
      where: 'portfolio_id = ?',
      whereArgs: [portfolioId],
    );
  }

  Future<void> insertStrategy(Map<String, dynamic> strategy) async {
    final db = await database;
    await db.insert('strategies', strategy);
  }

  Future<List<Map<String, dynamic>>> getStrategies(String userId) async {
    final db = await database;
    return await db.query(
      'strategies',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  Future<void> saveBacktestResult(Map<String, dynamic> result) async {
    final db = await database;
    await db.insert('backtest_results', result);
  }

  Future<List<Map<String, dynamic>>> getBacktestResults(
      String strategyId) async {
    final db = await database;
    return await db.query(
      'backtest_results',
      where: 'strategy_id = ?',
      whereArgs: [strategyId],
      orderBy: 'tested_at DESC',
    );
  }

  // Watchlist Methods
  Future<List<String>> getWatchlist() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('watchlist', orderBy: 'added_at ASC');
    return List.generate(maps.length, (i) => maps[i]['symbol'] as String);
  }

  Future<void> addToWatchlist(String symbol) async {
    final db = await database;
    await db.insert(
      'watchlist',
      {
        'symbol': symbol.toUpperCase(),
        'added_at': DateTime.now().millisecondsSinceEpoch,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<void> removeFromWatchlist(String symbol) async {
    final db = await database;
    await db.delete(
      'watchlist',
      where: 'symbol = ?',
      whereArgs: [symbol],
    );
  }
}
