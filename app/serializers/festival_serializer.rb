class FestivalSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :location, :venue, :line_up, :start, :end, :when, :website, :creator_id, :world_part, :artists

  def category
  	Category.find(object.category_id).name
  end

  def world_part
  	WorldPart.find(object.world_part_id).name
  end

  def when
  	object.start.strftime('%e %B %Y')
  end

end