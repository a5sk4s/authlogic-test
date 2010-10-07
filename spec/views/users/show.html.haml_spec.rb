require 'spec_helper'

describe "users/show.html.haml" do
  before(:each) do
    activate_authlogic
    user = Factory.build(:valid_user)
    UserSession.create user
    @view.stub(:current_user).and_return(user)
    assign(:user, stub_model(User))
  end

  it "renders attributes in <p>" do
    render
  end
end
