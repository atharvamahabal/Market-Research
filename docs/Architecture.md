## 1. Architecture Design

```mermaid
graph TD
    A[Flutter App] --> B[Presentation Layer]
    B --> C[Business Logic (Riverpod)]
    C --> D[Repository Layer]
    D --> E[Local Data Source (Sqflite)]
    D --> F[Remote Data Source (Yahoo API)]
    D --> G[Authentication (Google Sign-In)]
    
    subgraph "Presentation Layer"
        B
    end
    
    subgraph "Domain Layer"
        C
    end
    
    subgraph "Data Layer"
        D
        E
        F
        G
    end
```

## 2. Technology Description

- **Frontend**: Flutter (Dart)
- **Architecture**: Clean Architecture + Riverpod (State Management)
- **Local Database**: Sqflite
- **Authentication**: google_sign_in
- **Market Data**: Yahoo Finance API (unofficial) via Dio
- **Charts**: fl_chart
- **Navigation**: go_router
- **JSON Serialization**: json_serializable + build_runner

## 3. Route Definitions

| Route | Purpose |
|-------|---------|
| /login | Authentication screen with Google Sign-In |
| /dashboard | Main market overview with live prices |
| /portfolio | User holdings and transaction history |
| /trading/:symbol | Buy/sell interface for specific symbols |
| /strategies | Strategy builder and management |
| /backtesting | Historical strategy testing interface |
| /settings | User preferences and capital management |

## 4. API Definitions

### 4.1 Yahoo Finance API Integration

**Market Data Fetch**
```
GET https://query1.finance.yahoo.com/v8/finance/chart/{symbol}
```

Request Parameters:
| Param Name | Param Type | isRequired | Description |
|------------|------------|------------|-------------|
| symbol | string | true | NSE symbol (e.g., "RELIANCE.NS") |
| interval | string | true | Time interval ("5m" for 5-minute candles) |
| range | string | true | Data range ("1d" for intraday) |

Response Structure:
```json
{
  "chart": {
    "result": [{
      "meta": {
        "regularMarketPrice": 2500.50,
        "previousClose": 2480.00
      },
      "timestamp": [1643723400, 1643723700],
      "indicators": {
        "quote": [{
          "open": [2490.00, 2495.00],
          "high": [2500.00, 2505.00],
          "low": [2485.00, 2490.00],
          "close": [2498.00, 2500.50],
          "volume": [100000, 120000]
        }]
      }
    }]
  }
}
```

## 5. Data Model (Schema)

**User Table**
```sql
CREATE TABLE users (
    id TEXT PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    google_id TEXT UNIQUE NOT NULL,
    initial_capital REAL DEFAULT 100000.0,
    available_balance REAL DEFAULT 100000.0,
    created_at INTEGER
);
```

**Portfolio Table**
```sql
CREATE TABLE portfolios (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    name TEXT NOT NULL,
    total_value REAL DEFAULT 0.0,
    unrealized_pnl REAL DEFAULT 0.0,
    realized_pnl REAL DEFAULT 0.0,
    created_at INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

**Holdings Table**
```sql
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
);
```

**Transactions Table**
```sql
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
);
```
