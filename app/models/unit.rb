class Unit < ActiveRecord::Base

	belongs_to :unit_group

	validates :code, presence: true, length: { maximum: 20 }, uniqueness: true
	validates :name, presence: true, length: { maximum: 50 }
	validates :unit_group_id, presence: true
	
end
