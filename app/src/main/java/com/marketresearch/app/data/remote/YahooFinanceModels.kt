package com.marketresearch.app.data.remote

import com.google.gson.annotations.SerializedName

data class YahooChartResponse(
    @SerializedName("chart") val chart: ChartData
)

data class ChartData(
    @SerializedName("result") val result: List<ChartResult>?,
    @SerializedName("error") val error: Any?
)

data class ChartResult(
    @SerializedName("meta") val meta: ChartMeta,
    @SerializedName("timestamp") val timestamp: List<Long>?,
    @SerializedName("indicators") val indicators: ChartIndicators
)

data class ChartMeta(
    @SerializedName("currency") val currency: String,
    @SerializedName("symbol") val symbol: String,
    @SerializedName("regularMarketPrice") val regularMarketPrice: Double,
    @SerializedName("previousClose") val previousClose: Double,
    @SerializedName("regularMarketDayHigh") val regularMarketDayHigh: Double,
    @SerializedName("regularMarketDayLow") val regularMarketDayLow: Double,
    @SerializedName("regularMarketVolume") val regularMarketVolume: Long
)

data class ChartIndicators(
    @SerializedName("quote") val quote: List<ChartQuote>
)

data class ChartQuote(
    @SerializedName("open") val open: List<Double?>?,
    @SerializedName("high") val high: List<Double?>?,
    @SerializedName("low") val low: List<Double?>?,
    @SerializedName("close") val close: List<Double?>?,
    @SerializedName("volume") val volume: List<Long?>?
)
