class Volume
  include Mongoid::Document

  field :value
  field :price
  field :old_price

  embedded_in :product, inverse_of: :volumes

end
