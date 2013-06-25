class Post < ActiveRecord::Base
  attr_accessible :description, :title, :permalinks

  validates :permalinks, uniqueness: true, format: { with: /[a-z0-9-]+/ }
end
