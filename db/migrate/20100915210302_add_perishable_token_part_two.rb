class AddPerishableTokenPartTwo < ActiveRecord::Migration
  def self.up
    User.all.each { |u| u.reset_perishable_token! }
    change_column :users, :perishable_token, :string, :null => false
  end

  def self.down
  end
end
