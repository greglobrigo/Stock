class Stock < ApplicationRecord
  belongs_to :user  
  def self.top_trending
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token],
      secret_token: Rails.application.credentials.iex_client[:secret_token],
      endpoint: Rails.application.credentials.iex_client[:endpoint],
    )
    client.stock_market_list(:mostactive)
  end
end
