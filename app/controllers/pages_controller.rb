class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def analytics
    if params[:period]
      @month = params[:period].to_i
      @range =  @month.month.ago..Time.now
      @days = 30 * params[:period].to_i
    else
      @range = 1.month.ago..Time.now
      @days = 30
    end
  end
end
