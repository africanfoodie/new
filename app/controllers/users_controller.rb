class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to '/users/show', notice: 'User was successfully updated.' }
      else
        format.html { render '/users/show' }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :line1, :line2, :town, :county, :postcode, :password, :password_confrimation, :avatar, :organization)
  end

end