class AddAreaToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :area, :integer
  end
end
