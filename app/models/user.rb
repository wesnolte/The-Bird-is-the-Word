class User < ActiveRecord::Base
  before_save :set_level
  
  has_one :score, :dependent => :destroy
  accepts_nested_attributes_for :score
  
  has_many :tweets
  
  private
    def set_level
      
      score = self.score.value
      puts "callback score: "+score.inspect
      
      level = 0
      
      case 
        when score > 20
          level = 6
        when score > 15
          level = 5
        when score > 10
          level = 4
        when score > 5
          level = 3
        when score > 2
          level = 2
        when score > 0
          level = 1
      end
      
      self.level = level
    end
end


# == Schema Information
#
# Table name: users
#
#  id                :integer         not null, primary key
#  screen_name       :string(255)
#  name              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  profile_image_url :string(255)
#  level             :integer
#

