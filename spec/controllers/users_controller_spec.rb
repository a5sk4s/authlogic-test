require 'spec_helper'

describe UsersController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  describe "when no user is authenticated" do
    describe "GET new" do
      it "assigns a new user as @user" do
        User.stub(:new) { mock_user }
        get :new
        assigns(:user).should be(mock_user)
      end
    end

    describe "POST create" do

      describe "with valid params" do
        it "assigns a newly created user as @user" do
          User.stub(:new).with({'these' => 'params'}) { mock_user(:save_without_session_maintenance => true) }
          post :create, :user => {'these' => 'params'}
          assigns(:user).should be(mock_user)
        end

        it "redirects to the registration page" do
          User.stub(:new) { mock_user(:save_without_session_maintenance => true) }
          post :create, :user => {}
          response.should redirect_to(register_url)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved user as @user" do
          User.stub(:new).with({'these' => 'params'}) { mock_user(:save_without_session_maintenance => false) }
          post :create, :user => {'these' => 'params'}
          assigns(:user).should be(mock_user)
        end

        it "re-renders the 'new' template" do
          User.stub(:new) { mock_user(:save_without_session_maintenance => false) }
          post :create, :user => {}
          response.should render_template("new")
        end
      end
    end
    
    describe "GET index" do
      it "fails to load" do
        get :index
        response.should_not be_success
      end

      it "redirects to the login page" do
        get :index
        response.should redirect_to(login_url)
      end
    end

    describe "GET show" do
      it "fails to load" do
        get :show, :id => "13"
        response.should_not be_success
      end

      it "redirects to the login page" do
        get :show, :id => "13"
        response.should redirect_to(login_url)
      end
    end

    describe "GET edit" do
      it "fails to load" do
        get :edit, :id => "13"
        response.should_not be_success
      end

      it "redirects to the login page" do
        get :edit, :id => "13"
        response.should redirect_to(login_url)
      end
    end

    describe "PUT update" do
      it "fails to load" do
        put :update, :id => "13"
        response.should_not be_success
      end

      it "redirects to the login page" do
        put :update, :id => "13"
        response.should redirect_to(login_url)
      end
    end

    describe "DELETE destroy" do
      it "fails to load" do
        delete :destroy, :id => "13"
        response.should_not be_success
      end

      it "redirects to the login page" do
        delete :destroy, :id => "13"
        response.should redirect_to(login_url)
      end
    end
  end

  describe "when a user is authenticated" do
    before(:each) do
      activate_authlogic
      UserSession.create Factory.build(:valid_user)
    end

    describe "GET index" do
      it "assigns all users as @users" do
        User.stub(:all) { [mock_user] }
        get :index
        assigns(:users).should eq([mock_user])
      end
    end

    describe "GET show" do
      it "assigns the requested user as @user" do
        User.stub(:find).with("13") { mock_user }
        get :show, :id => "13"
        assigns(:user).should be(mock_user)
      end
    end

    describe "GET edit" do
      it "assigns the requested user as @user" do
        User.stub(:find).with("13") { mock_user }
        get :edit, :id => "13"
        assigns(:user).should be(mock_user)
      end
    end

    describe "PUT update" do

      describe "with valid params" do
        it "updates the requested user" do
          User.should_receive(:find).with("13") { mock_user }
          mock_user.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "13", :user => {'these' => 'params'}
        end

        it "assigns the requested user as @user" do
          User.stub(:find) { mock_user(:update_attributes => true) }
          put :update, :id => "13"
          assigns(:user).should be(mock_user)
        end

        it "redirects to the user" do
          User.stub(:find) { mock_user(:update_attributes => true) }
          put :update, :id => "13"
          response.should redirect_to(user_url(mock_user))
        end
      end

      describe "with invalid params" do
        it "assigns the user as @user" do
          User.stub(:find) { mock_user(:update_attributes => false) }
          put :update, :id => "13"
          assigns(:user).should be(mock_user)
        end

        it "re-renders the 'edit' template" do
          User.stub(:find) { mock_user(:update_attributes => false) }
          put :update, :id => "13"
          response.should render_template("edit")
        end
      end

    end

    describe "DELETE destroy" do
      it "destroys the requested user" do
        User.should_receive(:find).with("13") { mock_user }
        mock_user.should_receive(:destroy)
        delete :destroy, :id => "13"
      end

      it "redirects to the users list" do
        User.stub(:find) { mock_user }
        delete :destroy, :id => "13"
        response.should redirect_to(users_url)
      end
    end
  end
end
