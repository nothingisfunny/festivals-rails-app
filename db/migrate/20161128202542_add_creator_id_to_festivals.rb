class AddCreatorIdToFestivals < ActiveRecord::Migration
  def change
  	add_column :festivals, :creator_id, :integer
  end
end
