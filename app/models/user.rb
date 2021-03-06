class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.logged_in_timeout = 2.minutes # default is 10.minutes
    c.validate_email_field false
    c.validate_password_field false
  end
  
  validates :email, 
    :presence => true, 
    :uniqueness => { :case_sensitive => false },
    :length => { :within => 6..100 }, 
    :format => { :with => Authlogic::Regex.email, :message => 'must contain a valid email' }

  validates :password, 
    :presence => true, 
    :confirmation => true, 
    :length => { :within => 6..40 }, 
    :format => { :with => /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*(\W|_))([\x20-\x7E])*$/, :message => 'must contain at least one upper-case, lower-case, digit and special character' },
    :if => :require_password?

  scope :active, lambda { { :conditions => ["activated_at <= ?", Time.now.utc] } }

  def active?
    !self.activated_at.nil?
  end

  def activate!
    self.activated_at = Time.now.utc
    save
  end

  def deliver_password_instructions!
    self.reset_perishable_token!
    Notifier.password_instructions(self).deliver
  end

  def deliver_activation_instructions!
    self.reset_perishable_token!
    Notifier.activation_instructions(self).deliver
  end
end
