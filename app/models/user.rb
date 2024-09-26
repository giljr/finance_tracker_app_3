class User < ApplicationRecord
  has_many :user_stocks, dependent: :destroy
  has_many :stocks, through: :user_stocks

  # Include default Devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Check if the user can track the stock based on the ticker symbol
  def can_track_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_tracked?(ticker_symbol)
  end

  # Check if the user is under the stock limit (e.g., 10 stocks)
  def under_stock_limit?
    stocks.count < 10
  end

  # Check if the user is already tracking the stock
  def stock_already_tracked?(ticker_symbol)
    stock = Stock.find_by(ticker: ticker_symbol)
    stocks.where(id: stock.id).exists? if stock
  end
  
  def get_name
    if name.present?
      name
    elsif email.present?
      email
    else
      "anonymous"
    end
  end
end