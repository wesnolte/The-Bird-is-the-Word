require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: tweets
#
#  id                 :integer         not null, primary key
#  user_id            :string(255)
#  id_str             :string(255)
#  twitter_created_at :datetime
#  text               :string(255)
#  source             :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  twitter_id         :string(255)
#

