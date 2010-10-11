require 'spec_helper'

describe "users/new.html.haml" do
  before(:each) do
    @user = assign(:user, stub_model(User).as_new_record)
  end

  it "renders new user form" do
    render

    rendered.should have_selector("form", :action => users_path, :method => "post") do |form|
    end
  end
end
