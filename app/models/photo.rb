class Photo < ApplicationRecord
	belongs_to :two_wheeler
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
