class Brand
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name,          type: String
  field :description,   type: String
  field :slug,          type: String

  has_mongoid_attached_file :image,
                            styles: {
                                thumb: '150x150'
                            }
  do_not_validate_attachment_file_type :image

  has_many :products, inverse_of: :brand

  def image_url
    image.url
  end

end
