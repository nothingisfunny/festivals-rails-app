class AddWorldPartIdToFestivals < ActiveRecord::Migration
  def change
  	add_column :festivals, :world_part_id, :integer
  end
end
