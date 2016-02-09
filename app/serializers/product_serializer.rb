class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name_en, :name_ru, :description, :title, :price, :categories

end
