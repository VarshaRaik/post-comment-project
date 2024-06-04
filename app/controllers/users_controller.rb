class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  

 private
    def user_params
     params.require(:user).permit(:email, :current_password, :first_name, :last_name, :mobile_number, :address, :image)
    end
end
