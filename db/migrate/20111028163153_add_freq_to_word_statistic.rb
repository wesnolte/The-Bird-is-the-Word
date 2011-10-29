class AddFreqToWordStatistic < ActiveRecord::Migration
  def self.up
    add_column :word_statistics, :freq, :integer
  end

  def self.down
    remove_column :word_statistics, :freq
  end
end
