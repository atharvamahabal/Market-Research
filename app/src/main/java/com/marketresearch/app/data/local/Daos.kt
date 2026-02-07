package com.marketresearch.app.data.local

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import kotlinx.coroutines.flow.Flow

@Dao
interface UserDao {
    @Query("SELECT * FROM users WHERE id = :userId")
    suspend fun getUser(userId: String): UserEntity?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertUser(user: UserEntity)

    @Update
    suspend fun updateUser(user: UserEntity)
}

@Dao
interface PortfolioDao {
    @Query("SELECT * FROM portfolios WHERE userId = :userId")
    fun getPortfolios(userId: String): Flow<List<PortfolioEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPortfolio(portfolio: PortfolioEntity)

    @Query("SELECT * FROM holdings WHERE portfolioId = :portfolioId")
    fun getHoldings(portfolioId: String): Flow<List<HoldingEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertHolding(holding: HoldingEntity)
    
    @Update
    suspend fun updateHolding(holding: HoldingEntity)
    
    @Query("DELETE FROM holdings WHERE id = :holdingId")
    suspend fun deleteHolding(holdingId: String)
}

@Dao
interface TransactionDao {
    @Query("SELECT * FROM transactions WHERE userId = :userId ORDER BY timestamp DESC")
    fun getTransactions(userId: String): Flow<List<TransactionEntity>>

    @Insert
    suspend fun insertTransaction(transaction: TransactionEntity)
}

@Dao
interface StrategyDao {
    @Query("SELECT * FROM strategies WHERE userId = :userId")
    fun getStrategies(userId: String): Flow<List<StrategyEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertStrategy(strategy: StrategyEntity)
}
