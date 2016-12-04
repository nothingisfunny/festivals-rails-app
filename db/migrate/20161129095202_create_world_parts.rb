class CreateWorldParts < ActiveRecord::Migration
  def change
    create_table :world_parts do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
