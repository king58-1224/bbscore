class BattingOrder < ApplicationRecord
  belongs_to :game
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position
end
