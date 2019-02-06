
class User < ActiveRecord::Base
  has_secure_password #this adds a few methods
  #password getter & setter methods
  #authenticate #=> user
end