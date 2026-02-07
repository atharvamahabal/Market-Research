package com.marketresearch.app.data.repository

import com.marketresearch.app.data.remote.YahooFinanceApi
import com.marketresearch.app.data.remote.YahooChartResponse
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class MarketRepository @Inject constructor(
    private val api: YahooFinanceApi
) {
    suspend fun getStockData(symbol: String, interval: String = "5m", range: String = "1d"): Flow<Result<YahooChartResponse>> = flow {
        try {
            val response = api.getChartData(symbol, interval, range)
            emit(Result.success(response))
        } catch (e: Exception) {
            emit(Result.failure(e))
        }
    }
}
