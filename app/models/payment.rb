class Payment < ActiveRecord::Base
  belongs_to :line_item
  belongs_to :service
  attr_accessible :data, :line_item_id, :service_id

  validates :line_item_id, uniqueness: {scope: :service_id}
end
