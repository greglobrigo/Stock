class Market < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token],
      secret_token: Rails.application.credentials.iex_client[:secret_token],
      endpoint: Rails.application.credentials.iex_client[:endpoint],
    )
    client.price(ticker_symbol)
  end
  def self.get_most_active
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token],
      secret_token: Rails.application.credentials.iex_client[:secret_token],
      endpoint: Rails.application.credentials.iex_client[:endpoint],
    )
    client.stock_market_list(:mostactive)
  end
  def self.get_gainers
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token],
      secret_token: Rails.application.credentials.iex_client[:secret_token],
      endpoint: Rails.application.credentials.iex_client[:endpoint],
    )
    client.stock_market_list(:gainers)
  end

end
