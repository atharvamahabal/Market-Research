package com.marketresearch.app.di

import android.content.Context
import androidx.room.Room
import com.marketresearch.app.data.local.AppDatabase
import com.marketresearch.app.data.local.PortfolioDao
import com.marketresearch.app.data.local.StrategyDao
import com.marketresearch.app.data.local.TransactionDao
import com.marketresearch.app.data.local.UserDao
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object DatabaseModule {

    @Provides
    @Singleton
    fun provideAppDatabase(@ApplicationContext context: Context): AppDatabase {
        return Room.databaseBuilder(
            context,
            AppDatabase::class.java,
            "market_research.db"
        ).build()
    }

    @Provides
    fun provideUserDao(database: AppDatabase): UserDao = database.userDao()

    @Provides
    fun providePortfolioDao(database: AppDatabase): PortfolioDao = database.portfolioDao()

    @Provides
    fun provideTransactionDao(database: AppDatabase): TransactionDao = database.transactionDao()

    @Provides
    fun provideStrategyDao(database: AppDatabase): StrategyDao = database.strategyDao()
}
