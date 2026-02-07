package com.marketresearch.app.data.local

import androidx.room.Database
import androidx.room.RoomDatabase

@Database(
    entities = [
        UserEntity::class,
        PortfolioEntity::class,
        HoldingEntity::class,
        TransactionEntity::class,
        StrategyEntity::class
    ],
    version = 1,
    exportSchema = false
)
abstract class AppDatabase : RoomDatabase() {
    abstract fun userDao(): UserDao
    abstract fun portfolioDao(): PortfolioDao
    abstract fun transactionDao(): TransactionDao
    abstract fun strategyDao(): StrategyDao
}
