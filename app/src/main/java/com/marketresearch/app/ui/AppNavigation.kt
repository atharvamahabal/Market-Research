package com.marketresearch.app.ui

import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Icon
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.navigation.NavDestination.Companion.hierarchy
import androidx.navigation.NavGraph.Companion.findStartDestination
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.marketresearch.app.ui.backtest.BacktestScreen
import com.marketresearch.app.ui.dashboard.DashboardScreen
import com.marketresearch.app.ui.login.LoginScreen
import com.marketresearch.app.ui.portfolio.PortfolioScreen
import com.marketresearch.app.ui.strategy.StrategyScreen
import com.marketresearch.app.ui.trading.TradingScreen

sealed class Screen(val route: String, val title: String) {
    object Login : Screen("login", "Login")
    object Dashboard : Screen("dashboard", "Dashboard")
    object Portfolio : Screen("portfolio", "Portfolio")
    object Strategy : Screen("strategy", "Strategy")
    object Backtest : Screen("backtest", "Backtest")
    object Trading : Screen("trading/{symbol}", "Trading") {
        fun createRoute(symbol: String) = "trading/$symbol"
    }
}

@Composable
fun AppNavigation() {
    val navController = rememberNavController()
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination

    val bottomNavItems = listOf(
        Screen.Dashboard,
        Screen.Portfolio,
        Screen.Strategy,
        Screen.Backtest
    )

    Scaffold(
        bottomBar = {
            if (currentDestination?.route != Screen.Login.route) {
                NavigationBar {
                    bottomNavItems.forEach { screen ->
                        NavigationBarItem(
                            icon = { /* TODO: Add icons */ },
                            label = { Text(screen.title) },
                            selected = currentDestination?.hierarchy?.any { it.route == screen.route } == true,
                            onClick = {
                                navController.navigate(screen.route) {
                                    popUpTo(navController.graph.findStartDestination().id) {
                                        saveState = true
                                    }
                                    launchSingleTop = true
                                    restoreState = true
                                }
                            }
                        )
                    }
                }
            }
        }
    ) { innerPadding ->
        NavHost(
            navController = navController,
            startDestination = Screen.Login.route,
            modifier = Modifier.padding(innerPadding)
        ) {
            composable(Screen.Login.route) {
                LoginScreen(onLoginSuccess = {
                    navController.navigate(Screen.Dashboard.route) {
                        popUpTo(Screen.Login.route) { inclusive = true }
                    }
                })
            }
            composable(Screen.Dashboard.route) { DashboardScreen() }
            composable(Screen.Portfolio.route) { PortfolioScreen() }
            composable(Screen.Strategy.route) { StrategyScreen() }
            composable(Screen.Backtest.route) { BacktestScreen() }
            composable(
                route = Screen.Trading.route,
                arguments = listOf(navArgument("symbol") { type = NavType.StringType })
            ) { backStackEntry ->
                val symbol = backStackEntry.arguments?.getString("symbol") ?: ""
                TradingScreen(symbol = symbol)
            }
        }
    }
}
