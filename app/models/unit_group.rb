class UnitGroup < ActiveRecord::Base

	has_many :units

	validates :code, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }
	validates :name, presence: true, length: { maximum: 50 }
end
