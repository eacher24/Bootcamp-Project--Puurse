class AddTotalAndMonthlySpendToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :total_spend, :decimal
    add_column :categories, :monthly_spend, :decimal
  end
end
