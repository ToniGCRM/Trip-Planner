class Location < ApplicationRecord
  belongs_to :trip, dependent: :destroy
end
