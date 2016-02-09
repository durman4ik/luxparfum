class BrandsSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url

  has_many :products

end
