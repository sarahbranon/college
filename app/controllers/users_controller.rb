class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def onboarding
    ModelWizard.new(@user, session).start
  end

  def update
    # if @user.update_attributes(params[:user])
    #   redirect_to users_path, notice: "User updated."
    # else
    #   redirect_to users_path, alert: "Unable to update user."
    # end

    wizard = ModelWizard.new(@user, session, params).process
    if wizard.save
      redirect_to @user, notice: 'User updated.'
    else
      render :onboarding
    end
  end

  def destroy
    unless @user == current_user
      @user.destroy
      redirect_to users_path, notice: "User deleted."
    else
      redirect_to users_path, notice: "Can't delete yourself."
    end
  end
end