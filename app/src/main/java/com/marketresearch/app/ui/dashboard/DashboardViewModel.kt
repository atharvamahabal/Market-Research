package com.marketresearch.app.ui.dashboard

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.marketresearch.app.data.remote.YahooChartResponse
import com.marketresearch.app.data.repository.MarketRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

data class MarketState(
    val isLoading: Boolean = false,
    val data: Map<String, YahooChartResponse?> = emptyMap(),
    val error: String? = null
)

@HiltViewModel
class DashboardViewModel @Inject constructor(
    private val repository: MarketRepository
) : ViewModel() {

    private val _state = MutableStateFlow(MarketState())
    val state: StateFlow<MarketState> = _state.asStateFlow()

    private val watchlist = listOf("^NSEI", "^NSEBANK", "RELIANCE.NS", "TCS.NS", "INFY.NS")

    init {
        refreshMarketData()
    }

    fun refreshMarketData() {
        viewModelScope.launch {
            _state.value = _state.value.copy(isLoading = true)
            watchlist.forEach { symbol ->
                repository.getStockData(symbol).collect { result ->
                    result.onSuccess { response ->
                        val currentData = _state.value.data.toMutableMap()
                        currentData[symbol] = response
                        _state.value = _state.value.copy(data = currentData, error = null)
                    }.onFailure {
                        _state.value = _state.value.copy(error = it.message)
                    }
                }
            }
            _state.value = _state.value.copy(isLoading = false)
        }
    }
}
