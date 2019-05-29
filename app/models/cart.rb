class Cart < ApplicationRecord
  # product in cart
  belongs_to :order
  belongs_to :product
end
