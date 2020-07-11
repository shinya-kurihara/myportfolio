class AddAdressToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :adress, :string
  end
end
