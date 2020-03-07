class Trip < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :locations
end
