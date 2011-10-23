class AddTwitterIdToTweet < ActiveRecord::Migration
  def self.up
    add_column :tweets, :twitter_id, :string
  end

  def self.down
    remove_column :tweets, :twitter_id
  end
end
