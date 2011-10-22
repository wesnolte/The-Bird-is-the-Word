class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :screen_name
      t.string :name

      t.timestamps
    end
    
#    execute "ALTER TABLE users ADD PRIMARY KEY (screen_name);"
  end

  def self.down
    drop_table :users
  end
end
