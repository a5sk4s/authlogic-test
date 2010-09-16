class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.logged_in_timeout = 2.minutes # default is 10.minutes
    c.validate_password_field false
    c.validates_length_of_password_confirmation_field_options :within => 8..40
  end
  
  validates :password, 
    :presence => true, 
    :confirmation => true, 
    :length => { :within => 8..40 }, 
    :format => { :with => /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*(\W|_))([\x20-\x7E])*$/, :message => 'must contain at least one upper-case, lower-case, digit and special character' },
    :if => :require_password?
  
  def deliver_password_reset_instructions!
    self.reset_perishable_token!
    Notifier.password_reset_instructions(self).deliver
  end
end
