class AddApprovedColumnToFestivals < ActiveRecord::Migration
  def change
  	add_column :festivals, :approved, :boolean, :default => false
  end
end
