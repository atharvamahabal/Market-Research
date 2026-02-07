package com.marketresearch.app.ui.dashboard

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.marketresearch.app.data.remote.YahooChartResponse

@Composable
fun DashboardScreen(
    viewModel: DashboardViewModel = hiltViewModel()
) {
    val state by viewModel.state.collectAsState()

    Box(modifier = Modifier.fillMaxSize()) {
        if (state.isLoading && state.data.isEmpty()) {
            CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
        } else {
            LazyColumn(
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                item {
                    Text(
                        text = "Market Watch",
                        style = MaterialTheme.typography.headlineMedium,
                        modifier = Modifier.padding(bottom = 16.dp)
                    )
                }
                
                if (state.error != null) {
                    item {
                        Text(text = "Error: ${state.error}", color = MaterialTheme.colorScheme.error)
                    }
                }

                items(state.data.keys.toList()) { symbol ->
                    val data = state.data[symbol]
                    MarketItemCard(symbol = symbol, data = data)
                }
            }
        }
    }
}

@Composable
fun MarketItemCard(symbol: String, data: YahooChartResponse?) {
    val meta = data?.chart?.result?.firstOrNull()?.meta
    val price = meta?.regularMarketPrice ?: 0.0
    val prevClose = meta?.previousClose ?: 0.0
    val change = price - prevClose
    val changePercent = if (prevClose != 0.0) (change / prevClose) * 100 else 0.0
    val isPositive = change >= 0

    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text(text = symbol, style = MaterialTheme.typography.titleMedium)
                Text(text = "LTP: ${String.format("%.2f", price)}", style = MaterialTheme.typography.bodyMedium)
            }
            Column(horizontalAlignment = Alignment.End) {
                Text(
                    text = "${if (isPositive) "+" else ""}${String.format("%.2f", change)}",
                    color = if (isPositive) Color(0xFF2E7D32) else Color(0xFFD32F2F),
                    style = MaterialTheme.typography.bodyMedium
                )
                Text(
                    text = "(${if (isPositive) "+" else ""}${String.format("%.2f", changePercent)}%)",
                    color = if (isPositive) Color(0xFF2E7D32) else Color(0xFFD32F2F),
                    style = MaterialTheme.typography.bodySmall
                )
            }
        }
    }
}
