class Customer < ApplicationRecord
  has_many :salons_reservations, class_name: "Salons::Reservation"
  has_many :stylists_reservations, class_name: "Stylists::Reservation"
  has_many :menus, class_name: "Stylists::Menu"
  has_many :reservations

  belongs_to :prefecture

  VALID_PHONE_REGEX = /\A\d{10,11}\z/
  VALID_TYPES       = %w[User Salon Stylist]

  validates :name, presence: true, length: { maximum: 30 }
  validates :tel, presence: true, length: { maximum: 11, minimum: 10 }, format: { with: VALID_PHONE_REGEX }
  validates :prefecture, presence: true
  validates :city, presence: true, length: { maximum: 10 }
  validates :address1, presence: true, length: { maximum: 50 }
  validates :type, presence: true, inclusion: { in: VALID_TYPES }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: { User: 0, Salon: 1, Stylist: 2 }

  def correct_customer?(name)
    type == type[name]
  end
end