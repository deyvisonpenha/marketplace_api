class Customer < ApplicationRecord
  belongs_to :user
  has_many :order
  #has_many :cart, through: :order
end
