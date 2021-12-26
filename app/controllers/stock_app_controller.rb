class StockAppController < ApplicationController
    before_action :authenticate_user! do
        redirect_to unapproved_path unless current_user.status == 'approved'
    end

    def index
    end
end
