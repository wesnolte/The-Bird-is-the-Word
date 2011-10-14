class User < ActiveRecord::Base
  
  has_one :score
end
