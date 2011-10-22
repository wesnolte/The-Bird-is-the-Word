class Score < ActiveRecord::Base
  
  belongs_to :user
end

# == Schema Information
#
# Table name: scores
#
#  id         :integer         not null, primary key
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

