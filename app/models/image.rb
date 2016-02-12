class Image
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :file,
                            storage: :s3,
                            styles: {
                                thumb: '150x150'
                            }

  do_not_validate_attachment_file_type :file

  belongs_to :product

end
