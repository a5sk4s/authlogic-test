require 'spec_helper'

describe User do
  it "should succeed creating a new user with valid attributes" do
    Factory.create(:valid_user)
  end

  it "should not succeed building a user without email" do
    Factory.build(:user_wo_email).should be_invalid
  end

  it "should not succeed building a user without password" do
    Factory.build(:user_wo_password).should be_invalid
  end

  it "should not succeed building a user without password confirmation" do
    Factory.build(:user_wo_confirmation).should be_invalid
  end

  it "should not succeed building a user without matching password confirmation" do
    Factory.build(:user_wo_matching_confirmation).should be_invalid
  end

  it "should not succeed building a user without a strong password" do
    Factory.build(:user_wo_strong_password).should be_invalid
  end

  pending "add some more examples to #{__FILE__}"
end
