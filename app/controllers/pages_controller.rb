class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def analytics
    user_transactions = current_user.transactions
    @transactions = []
    if params[:period]
      @month = params[:period].to_i
      @range =  @month.month.ago..Time.now
      @days = 30 * params[:period].to_i
      transactions = search_by_days(user_transactions, @days)
    else
      @range = 1.month.ago..Time.now
      @days = 30
      transactions = search_by_days(user_transactions, @days)
    end
    @total = transactions.inject(0) { |sum, transaction| sum + transaction.amount }
    @total = (@total * 100).floor / 100.0
    transactions.each do |transa|
      @transactions << transaction_info(transa)
    end
  end

  private

  def search_by_days(transactions, days)
    require 'date'

    # Get the current date
    current_date = Date.today
    # select the transactions from the past 30days
    selected_transactions = transactions.select do |transa|
      current_date - transa.date < days.to_i
    end
    sorted_transactions = selected_transactions.sort_by { |transa| transa.date }
    return sorted_transactions
  end

  def transaction_info(transaction)
    details = {
      amount: transaction.amount,
      date: transaction.date.strftime('%a, %d %b %Y'),
      retailer: transaction.retailer,
      bank: transaction.bank,
      category: transaction.category.name
    }
    return details
  end
end
