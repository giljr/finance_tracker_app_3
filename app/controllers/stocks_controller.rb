class StocksController < ApplicationController
  before_action :find_or_create_stock, only: [:create, :show]
  before_action :authenticate_user!

  def show
  end

  def new    
  end
  
  def index
    @tracked_stocks = current_user.stocks.order(created_at: :desc)
  end

  def create
    if @stock.present?
      if current_user.can_track_stock?(@stock.ticker)
        if @stock.save
          current_user.stocks << @stock
          redirect_to stocks_path, notice: "#{@stock.ticker} was successfully added to your portfolio."
        else
          redirect_to stocks_path, alert: 'Failed to save stock.'
        end
      else
        redirect_to stocks_path, alert: 'You are already tracking this stock or have reached your limit.'
      end
    else
      redirect_to stocks_path, alert: 'Failed to add stock. Ensure ticker is valid.'
    end
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = current_user.user_stocks.find_by(stock_id: stock.id)
    if user_stock
      user_stock.destroy
      flash[:notice] = "#{stock.ticker} was successfully removed from your portfolio."
    else
      flash[:alert] = "#{stock.ticker} could not be found in your portfolio."
    end
    redirect_to stocks_path
  end


  private

  def find_or_create_stock
    @stock = Stock.check_db(params[:ticker]) || Stock.new_lookup(params[:ticker])
    if @stock.present? && !@stock.persisted?
      @stock.save
    end
  end

  def stock_params
    params.permit(:ticker)
  end

end