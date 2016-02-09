class Order
  include Mongoid::Document


  field :name
  field :phone
  field :product_name
  field :count
  field :price
  field :volume, type: Hash
end
