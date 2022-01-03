class Market < ApplicationRecord
  def self.new_lookup(ticker_symbol)        
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:publishable_token] : ENV['IEX_PUBLISHABLE_TOKEN'],
      secret_token: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:secret_token] : ENV['IEX_SECRET_TOKEN'],
      endpoint: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:endpoint] : ENV['IEX_ENDPOINT'],
    )
    client.price(ticker_symbol)
  end
  def self.get_most_active
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:publishable_token] : ENV['IEX_PUBLISHABLE_TOKEN'],
      secret_token: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:secret_token] : ENV['IEX_SECRET_TOKEN'],
      endpoint: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:endpoint] : ENV['IEX_ENDPOINT'],
    )
    client.stock_market_list(:mostactive)
  end
  def self.get_gainers
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:publishable_token] : ENV['IEX_PUBLISHABLE_TOKEN'],
      secret_token: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:secret_token] : ENV['IEX_SECRET_TOKEN'],
      endpoint: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:endpoint] : ENV['IEX_ENDPOINT'],
    )
    client.stock_market_list(:gainers)
  end
  def self.get_losers
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:publishable_token] : ENV['IEX_PUBLISHABLE_TOKEN'],
      secret_token: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:secret_token] : ENV['IEX_SECRET_TOKEN'],
      endpoint: Rails.application.credentials.iex_client != nil ? Rails.application.credentials.iex_client[:endpoint] : ENV['IEX_ENDPOINT'],
    )
    client.stock_market_list(:losers)
  end

end
