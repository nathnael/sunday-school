class DashboardController < ApplicationController
    def index 
    end

    def load_data    
        render json: [12, 19, 3, 5, 2, 3]
    end
end
