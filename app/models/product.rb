class Product < ApplicationRecord
    belongs_to :vendor

    validates :name, :price, :description,:productType, :tags, presence: true
end
