class User < ActiveRecord::Base
  
  has_one :score, :dependent => :destroy
  accepts_nested_attributes_for :score
end

# == Schema Information
#
# Table name: users
#
#  id          :integer         not null, primary key
#  screen_name :string(255)
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

