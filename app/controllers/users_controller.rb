class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:index, :show, :edit, :update, :destroy, :current]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
    end
  end

  def current
    @user = current_user

    respond_to do |format|
      format.html { render :action => :show }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.haml
    end
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save_without_session_maintenance
        @user.deliver_activation_instructions!
        format.html { redirect_to(register_url, :notice => 'Account created. Please check your e-mail for your account activation.') }
      else
        @user.password_confirmation = nil
        format.html { render :action => :new }
      end
    end
  end

  def edit
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # edit.html.haml
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'Account updated.') }
      else
        format.html { render :action => :edit }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
    end
  end
end
