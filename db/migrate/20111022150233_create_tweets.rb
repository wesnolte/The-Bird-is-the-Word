class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :user_id
      t.string :id_str
      t.datetime :twitter_created_at
      t.string :text
      t.string :source

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
