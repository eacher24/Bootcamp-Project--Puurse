class TransactionsController < ApplicationController

  def index
    # give me all the transactions for the current user
    user_transactions = current_user.transactions
    # array to store each transacion's information
    @transactions = []
    @total = 0
    if params[:period].present?
      user_transactions = search_by_days(user_transactions, params[:period])
    end

    if params[:bank].present?
      user_transactions = search_by_bank(user_transactions, params[:bank])
    end

    if params[:amount].present?
      user_transactions = search_by_amount(user_transactions, params[:amount])
    end

    if params[:category].present?
      user_transactions = search_by_category(user_transactions, params[:category])
    end

    user_transactions.each do |transa|
      # for each transaction pass it to the function to get the its information ie.its amount, date ...
      transaction = transaction_info(transa)
      # store the information in the @transactions array
      @transactions << transaction
      @total += transa.amount
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
    return selected_transactions
  end

  def search_by_category(transactions, category)
    # select the transactions that have this category
    selected_transactions = transactions.select do |transa|
      transa.category.name == category
    end
    # raise
    return selected_transactions
  end

  def search_by_bank(transactions ,bank)
    selected_transactions = transactions.select do |transa|
      transa.bank == bank
    end
    # raise
    return selected_transactions
  end

  def search_by_amount(transactions ,amount)
    selected_transactions = transactions.select do |transa|
      transa.amount > amount
    end
    # raise
    return selected_transactions
  end

  def get_budget(transaction)
    #get the category of the budget
    category = transaction.category
    # find the budget with this category_id
    budget = Budget.find_by(category_id: category.id)
    return budget
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
