class Addtwitterstufftouser < ActiveRecord::Migration
  def change
  	add_column :users, :image_url, :string
  	add_column :users, :followers_count, :string
  	add_column :users, :friends_count, :string
  end
end
