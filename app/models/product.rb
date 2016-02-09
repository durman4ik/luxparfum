class Product
  include Mongoid::Document

  VERSIONS = ['Туалетная вода', 'Парфюмерная вода', 'Масло', 'Тушь']

  attr_accessor :product_images, :options

  field :name_en,       type: String
  field :name_ru,       type: String
  field :description,   type: String
  field :title,         type: String
  field :first_notes,   type: String
  field :second_notes,  type: String
  field :third_notes,   type: String
  field :version,       type: String
  field :is_cosmetic,   type: Boolean, default: false
  field :for_man,       type: Boolean, default: false
  field :year,          type: String
  field :slug,          type: String

  index slug: 1

  embeds_many :volumes
  has_and_belongs_to_many :categories
  has_many   :images

  belongs_to :brand

  accepts_nested_attributes_for :volumes, allow_destroy: true

  def images_url
    images.map {|i| i.file.url}
  end

  def add_images(images)
    images.each { |i| self.images.create(file: i) }
  end
end
