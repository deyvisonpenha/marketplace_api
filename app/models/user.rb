class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :lockable,
          :recoverable, :trackable, :validatable

  ## Token Authenticatable
  acts_as_token_authenticatable

  has_one :vendor
  has_many :products, through: "vendors"
  has_one :customer
  
  def reset_authentication_token!
    update_column(:authentication_token, Devise.friendly_token)
  end
  

end
