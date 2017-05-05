class ItemsBestDaySerializer < ActiveModel::Serializer
  attributes :created_at

  def created_at
    object.to_s
  end
end
