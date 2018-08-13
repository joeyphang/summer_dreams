class Product < ApplicationRecord
	belongs_to :user
	mount_uploaders :avatar, AvatarUploader

	scope :title, -> (title) { where("title ilike ?", :title) }
	scope :price_range, -> (from,to) {where ("price >= ? AND price <= ?"), from, to}
end
