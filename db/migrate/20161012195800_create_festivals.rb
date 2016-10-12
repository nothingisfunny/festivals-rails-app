class CreateFestivals < ActiveRecord::Migration
  def change
    create_table :festivals do |t|
      t.string :name
      t.integer :category_id
      t.string :location
      t.string :venue
      t.string :line_up
      t.date :start
      t.date :end
      t.string :website
      t.timestamps null: false
    end
  end
end
