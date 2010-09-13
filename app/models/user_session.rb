class UserSession < Authlogic::Session::Base
  # TBD - investigate why this is needed for rspec2
  extend ActiveModel::Naming
end