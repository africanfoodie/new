class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :name, presence: true

  has_many :listings, dependent: :destroy
  # a listings existence depends on the existence of the user that created it
end
