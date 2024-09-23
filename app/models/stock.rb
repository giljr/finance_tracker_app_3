require "json"
require "net/http"

class Stock < ApplicationRecord
  validates :ticker, presence: true
  validates :name, presence: true
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.new_lookup(ticker_symbol)
    uri = URI.parse("https://economia.awesomeapi.com.br/last/#{ticker_symbol}")
    begin
      response = Net::HTTP.get_response(uri)
      data = JSON.parse(response.body)[ticker_symbol.delete('-')]
      if data
        new(
          ticker: ticker_symbol,
          name: data['name'],
          last_price: data['ask']
        )
      else
        nil
      end
    rescue JSON::ParserError, StandardError => e
      Rails.logger.error("Error fetching stock data for #{ticker_symbol}: #{e.message}")
      nil
    end
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

end