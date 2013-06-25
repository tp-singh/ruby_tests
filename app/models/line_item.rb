class LineItem < ActiveRecord::Base
  attr_accessible :item
  has_many :payments
end
