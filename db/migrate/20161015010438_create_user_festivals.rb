class CreateUserFestivals < ActiveRecord::Migration
  def change
    create_table :user_festivals do |t|
    	t.integer :user_id
    	t.integer :festival_id
    	t.string :status
    end
  end
end
