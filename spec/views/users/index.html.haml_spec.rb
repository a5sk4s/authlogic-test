require 'spec_helper'

describe "users/index.html.haml" do
  before(:each) do
    activate_authlogic
    user = Factory.build(:valid_user)
    UserSession.create user
    @view.stub(:current_user).and_return(user)
    assign(:users, [
      stub_model(User),
      stub_model(User)
    ])
  end

  it "renders a list of users" do
    render
  end
end
