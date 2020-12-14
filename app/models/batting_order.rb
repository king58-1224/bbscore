class BattingOrder < ApplicationRecord
  belongs_to :game
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :position
end
