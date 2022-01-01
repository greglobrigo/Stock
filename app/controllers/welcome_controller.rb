class WelcomeController < ApplicationController
  def index
    # @markets = Market.all
    @markets = Market.get_most_active  
    @gainers = Market.get_gainers
    @losers = Market.get_losers
  end
end
