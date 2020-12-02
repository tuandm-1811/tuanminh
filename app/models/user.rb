class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :email, presence: true, length: {maximum: 30}
         validates :password, presence: true, length: {maximum: 30}

end
