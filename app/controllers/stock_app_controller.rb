class StockAppController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :stock_params, only: [:purchase]
    before_action :authenticate_user! do
        redirect_to unapproved_path unless current_user.status == 'approved'
    end
    

    def index   
        @markets = Market.all
    end

    def buy
        @user = User.find(params[:user_id])
        @user_id = params[:user_id]
        @stock_name = params[:name]
        @stock_ticker = params[:ticker]
        @stock_price = params[:last_price]               
    end

    def purchase        
        @user = User.find(params[:user_id])            
        @stock = @user.stocks.new(stock_params)
        if @stock.save
            redirect_to stockapp_path
            flash[:notice] = "Stock purchased successfully!"
        else
            flash[:notice] = "Stock purchase failed!"
            render :buy
        end
    end

    private

    def stock_params    
        params.permit(:user_id, :name, :ticker, :last_price, :quantity)
    end
end
