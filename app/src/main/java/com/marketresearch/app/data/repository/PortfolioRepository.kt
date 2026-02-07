package com.marketresearch.app.data.repository

import com.marketresearch.app.data.local.HoldingEntity
import com.marketresearch.app.data.local.PortfolioDao
import com.marketresearch.app.data.local.TransactionDao
import com.marketresearch.app.data.local.TransactionEntity
import com.marketresearch.app.data.local.UserDao
import kotlinx.coroutines.flow.Flow
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class PortfolioRepository @Inject constructor(
    private val portfolioDao: PortfolioDao,
    private val transactionDao: TransactionDao,
    private val userDao: UserDao
) {

    fun getHoldings(portfolioId: String): Flow<List<HoldingEntity>> = portfolioDao.getHoldings(portfolioId)

    suspend fun executeBuy(
        userId: String,
        portfolioId: String,
        symbol: String,
        quantity: Int,
        price: Double
    ) {
        val totalAmount = quantity * price
        
        // 1. Deduct balance (Simplified: assuming user exists and has balance)
        val user = userDao.getUser(userId) ?: return
        if (user.availableBalance < totalAmount) {
            throw Exception("Insufficient balance")
        }
        userDao.updateUser(user.copy(availableBalance = user.availableBalance - totalAmount))

        // 2. Add/Update Holding
        // This logic needs to check if holding exists, calculate new avg price, etc.
        // For MVP/Paper Trading simplicity:
        val holdingId = UUID.randomUUID().toString()
        val holding = HoldingEntity(
            id = holdingId,
            portfolioId = portfolioId,
            symbol = symbol,
            quantity = quantity,
            avgBuyPrice = price,
            investedAmount = totalAmount,
            currentPrice = price,
            currentValue = totalAmount
        )
        portfolioDao.insertHolding(holding)

        // 3. Record Transaction
        val transaction = TransactionEntity(
            id = UUID.randomUUID().toString(),
            userId = userId,
            symbol = symbol,
            transactionType = "BUY",
            quantity = quantity,
            price = price,
            totalAmount = totalAmount
        )
        transactionDao.insertTransaction(transaction)
    }
}
