class Product < ApplicationRecord
  belongs_to :productable, polymorphic: true
  enum :status, { unavailable: 0, available: 1 }
end