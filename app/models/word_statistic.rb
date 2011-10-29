class WordStatistic < ActiveRecord::Base

end


# == Schema Information
#
# Table name: word_statistics
#
#  id         :integer         not null, primary key
#  word       :string(255)
#  day        :datetime
#  created_at :datetime
#  updated_at :datetime
#  freq       :integer
#

