class AddApprovedColumnToFestivals < ActiveRecord::Migration
  def change
  	add_column :festivals, :approved, :boolean
  end
end
