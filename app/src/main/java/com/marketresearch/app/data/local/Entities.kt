package com.marketresearch.app.data.local

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "users")
data class UserEntity(
    @PrimaryKey val id: String,
    val email: String,
    val name: String,
    val googleId: String,
    val initialCapital: Double = 100000.0,
    val availableBalance: Double = 100000.0,
    val createdAt: Long = System.currentTimeMillis()
)

@Entity(tableName = "portfolios")
data class PortfolioEntity(
    @PrimaryKey val id: String,
    val userId: String,
    val name: String,
    val totalValue: Double = 0.0,
    val unrealizedPnl: Double = 0.0,
    val realizedPnl: Double = 0.0,
    val createdAt: Long = System.currentTimeMillis()
)

@Entity(tableName = "holdings")
data class HoldingEntity(
    @PrimaryKey val id: String,
    val portfolioId: String,
    val symbol: String,
    val quantity: Int,
    val avgBuyPrice: Double,
    val currentPrice: Double = 0.0,
    val investedAmount: Double,
    val currentValue: Double = 0.0,
    val unrealizedPnl: Double = 0.0,
    val lastUpdated: Long = System.currentTimeMillis()
)

@Entity(tableName = "transactions")
data class TransactionEntity(
    @PrimaryKey val id: String,
    val userId: String,
    val symbol: String,
    val transactionType: String, // "BUY" or "SELL"
    val quantity: Int,
    val price: Double,
    val totalAmount: Double,
    val timestamp: Long = System.currentTimeMillis()
)

@Entity(tableName = "strategies")
data class StrategyEntity(
    @PrimaryKey val id: String,
    val userId: String,
    val name: String,
    val type: String, // "BUY" or "SELL"
    val conditions: String, // JSON or serialized string
    val stopLossPercentage: Double,
    val target1Percentage: Double,
    val target2Percentage: Double,
    val isActive: Boolean = true,
    val createdAt: Long = System.currentTimeMillis()
)
