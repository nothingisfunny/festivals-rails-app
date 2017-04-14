class FestivalSerializer < ActiveModel::Serializer
  attributes :id, :name, :category_id, :location, :venue, :line_up, :start, :end, :website, :creator_id, :world_part_id, :artists
end