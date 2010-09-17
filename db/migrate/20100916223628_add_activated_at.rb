class AddActivatedAt < ActiveRecord::Migration
  def self.up
    add_column :users, :activated_at, :datetime
    
    User.reset_column_information
    User.record_timestamps = false
    User.all.each { |u| u.activated_at = u.created_at; u.save }
  end

  def self.down
    remove_column :users, :activated_at
  end
end
