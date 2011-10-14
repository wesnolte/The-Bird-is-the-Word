class User < ActiveRecord::Base
  
  has_one :score
  accepts_nested_attributes_for :score
  
  
end
