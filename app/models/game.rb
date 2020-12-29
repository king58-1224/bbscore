class Game < ApplicationRecord
  belongs_to :team
  has_many :batting_orders, dependent: :destroy
  accepts_nested_attributes_for :batting_orders, allow_destroy: true
  
end
