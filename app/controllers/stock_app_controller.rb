<<<<<<< HEAD
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
=======
class StockAppController < ApplicationController  
  before_action :stock_params, only: [:purchase, :liquidate]
  before_action :authenticate_user! do
    redirect_to unapproved_path unless current_user.status == "approved"
  end

  def index
    @markets = Market.get_most_active  
    @gainers = Market.get_gainers
  end

  def profile
    @stocks = current_user.stocks
  end

  def buy
    @user_id = params[:user_id]
    @stock_name = params[:name]
    @stock_ticker = params[:ticker]
    @stock_price = params[:last_price]
    @stock_quantity = params[:quantity]
    @transaction_type = params[:transaction_type]    
  end

  def purchase
    user = User.find(params[:user_id])
    stock = user.stocks.new(stock_params)
    balance = user.balance
    stock_price = params[:last_price].to_f
    stock_quantity = params[:quantity].to_i
    stock_name = params[:name]
    total_price = stock_price * stock_quantity    
    total_owned_stock = Stock.where(user_id: user.id, name: stock_name).exists? ? Stock.where(user_id: user.id, name: stock_name).last.total_owned : 0
    if balance >= total_price      
      stock.save      
      updated_total_owned = total_owned_stock + stock_quantity         
      user.update(balance: balance - total_price)
      user.stocks.last.update(total_owned: updated_total_owned)
      flash[:notice] = "You have successfully purchased #{params[:quantity]} shares of #{params[:name]}."
      redirect_to stock_app_index_path
    else
      flash[:notice] = "You do not have enough funds to purchase #{params[:quantity]} shares of #{params[:name]}."
      redirect_to buy_path(user_id: params[:user_id], name: params[:name], ticker: params[:ticker], last_price: params[:last_price])
    end    
  end 

  def transaction_history
    @stocks = current_user.stocks
  end

  def sell
    @user_id = params[:user_id]
    @stock_name = params[:name]
    @stock_ticker = params[:ticker]
    @stock_price = params[:last_price]
    @stock_quantity = params[:quantity]
    @transaction_type = params[:transaction_type]
    @total_owned = Stock.where(user_id: params[:user_id], name: params[:name]).last.total_owned       
  end

  def liquidate
    user = User.find(params[:user_id])
    stock = user.stocks.new(stock_params)
    balance = user.balance
    stock_price = params[:last_price].to_f
    stock_quantity = params[:quantity].to_i
    stock_name = params[:name]
    total_value = stock_price * stock_quantity    
    total_owned_stock = Stock.where(user_id: user.id, name: stock_name).last.total_owned      
    stock.save      
    updated_total_owned = total_owned_stock - stock_quantity         
    user.update(balance: balance + total_value)
    user.stocks.last.update(total_owned: updated_total_owned)
    flash[:notice] = "You have successfully sold #{params[:quantity]} shares of #{params[:name]}."
    redirect_to stock_app_index_path
  end

  def cash_in
   
  end

  def transact_cash_in
    user = User.find(params[:user_id])
    cash_in_amount = params[:cash_in_amount].to_f
    balance = user.balance    
    user.update(balance: balance + cash_in_amount)
    flash[:notice] = "You have successfully cashed in $#{cash_in_amount} into your account."
    redirect_to stock_app_index_path
  end





  private

  def stock_params    
    params.permit(:user_id, :name, :ticker, :last_price, :quantity, :transaction_type)    
  end
>>>>>>> main
end
