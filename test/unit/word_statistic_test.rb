require 'test_helper'

class WordStatisticTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

