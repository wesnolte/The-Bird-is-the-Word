class RemoveCountFromWordStatistics < ActiveRecord::Migration
  def self.up
    remove_column :word_statistics, :count
  end

  def self.down
    add_column :word_statistics, :count, :integer
  end
end
