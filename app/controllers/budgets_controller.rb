class BudgetsController < ApplicationController
  before_action :set_category, only: [:new, :create, :edit, :update, :destroy]

    #new form for new budget
  def new
    @budget = Budget.new
  end

  #create new budget
  def create
    @budget = @category.budgets.new(budget_params)
    @budget.user = current_user # Assign the current user to the budget
    if @budget.save
    #change the root_path
      redirect_to transactions_path, notice: 'Budget created successfully.'
    else
      render :new
    end
  end

  #edit budget
  def edit
    @budget = @category.budgets.first
  end

  #update budget
  def update
    @budget = current_user.budgets.find(params[:id])
    if @budget.update(budget_params)
      #change the root path
      redirect_to transactions_path, notice: 'Budget updated successfully.'
    else
      render :edit
    end
  end

  # delete budget
  def destroy
    @budget = current_user.budgets.find(params[:id])
    @budget.destroy
    #change the root path
    redirect_to transactions_path, notice: 'Budget deleted successfully.'
  end

  private
  #set category based on category name
  def set_category
    @category = Category.find(params[:category_id])
    @category_name = @category.name
  end

  #strong params needed to create budget
  def budget_params
    params.require(:budget).permit(:category_id, :max_limit)
  end
end
