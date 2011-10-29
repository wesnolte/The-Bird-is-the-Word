class CreateWordStatistics < ActiveRecord::Migration
  def self.up
    create_table :word_statistics do |t|
      t.string :word
      t.integer :count
      t.datetime :day

      t.timestamps
    end
  end

  def self.down
    drop_table :word_statistics
  end
end
