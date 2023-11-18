class FoodsController < ApplicationController
    def index
        @foodlist = current_user.foods
    end

    def new
        @food = Food.new
    end

    def create
        @food = Food.new(food_parms)
        @food.users_id = current_user.id;

        if @food.save
            redirect_to foods_path, notice: 'Food succesfully created'
        else
            render :new
        end
    end
    
    def destroy
        @food = Food.find(params[:id])
        if @food.destroy
            redirect_to foods_path, notice: 'Food succesfully deleted'
        else
            redirect_to foods_path, alert: 'Failed to delete food'
        end
    end

    private
    
    def food_parms
        params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    end

end
