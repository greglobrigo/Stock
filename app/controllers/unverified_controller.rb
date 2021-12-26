class UnverifiedController < ApplicationController
    before_action :authenticate_user! do
        redirect_to root_path unless current_user.status == 'pending'
    end
    

    def index

    end

end
