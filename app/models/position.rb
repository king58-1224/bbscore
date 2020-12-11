class Position < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '投' },
   { id: 3, name: '捕' },
   { id: 4, name: '一' },
   { id: 5, name: '二' },
   { id: 6, name: '三' },
   { id: 7, name: '遊' },
   { id: 8, name: '左' },
   { id: 9, name: '中' },
   { id: 10, name: '右' }
  ]

  include ActiveHash::Associations
  has_many :batting_orders
end
