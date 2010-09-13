class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_back_or_default(users_url, :notice => 'Login successful.') }
      else
        format.html { render :action => :new }
      end
    end
  end

  def destroy
    # current_user_session.destroy
    @user_session = UserSession.find
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_back_or_default(new_user_session_url, :notice => 'Logout successful.') }
    end
  end
end
