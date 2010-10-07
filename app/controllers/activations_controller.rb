class ActivationsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit]
  before_filter :require_no_user, :only => [:edit, :update]

  def edit
    if @user.active?
      flash[:notice] = "Your account is already active."
      redirect_to(login_url) and return
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.active?
      flash[:notice] = "Your account is already active."
      redirect_to(login_url) and return
    end

    if @user.activate!
      flash[:notice] = "Your account has been activated."
      redirect_to login_url
    else
      render :action => :new
    end
  end

  private
    def load_user_using_perishable_token
      @user = User.find_using_perishable_token(params[:activation_code], 24.hours)
      unless @user
        @user.delete if @user && !@user.active?
        redirect_to new_user_url, :notice => "Your activation code has expired. Please sign up again."
      end
    end
end
