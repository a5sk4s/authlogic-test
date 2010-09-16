class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_user
  
  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def create
    @user = User.find_by_email(params[:email])
    respond_to do |format|
      if @user
        @user.deliver_password_reset_instructions!
        format.html { redirect_to(root_url, :notice => "Instructions to reset your password have been emailed to you. Please check your email.") }
      else
        format.html { render :action => :new, :notice => "We're sorry, we could not locate a user with that email address." }
      end
    end
  end
  
  def edit
    respond_to do |format|
      format.html # edit.html.erb
    end
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => "Password updated.") }
      else
        render :action => :edit
      end
    end
  end

  private
    def load_user_using_perishable_token
      @user = User.find_using_perishable_token(params[:id])
      unless @user
        redirect_to(new_password_reset_path, :notice => "We're sorry, we could not locate the account. Try copying and pasting the URL from your email into a browser or restart the reset password process.")
      end
    end
end
