class RedemptionsController < ApplicationController
    def edit
        @redemption = Redemption.find(params[:id])
    end

    def update
        @redemption = Redemption.find(params[:id])
        respond_to do |format|
          if @redemption.update(redemption_params)
            format.html { redirect_to @redemption, notice: 'Redemption was successfully updated.' }
          else
            format.html { render :edit }
          end
        end    
    end
    

    def index 
        @redemptions = Redemption.all
    end

    def show 
      redirect_to :controller => 'rewards_controller', :action => 'edit' , :id => params[:id]
    end

    private 
    # Only allow a list of trusted parameters through.
    def redemption_params
        params.require(:redemption).permit(:reward_id, :user_id, :adminNetID, :dateHandled)
    end
end
