class NutritionFact < ActiveRecord::Base

	belongs_to :size_unit, class_name: "Unit", foreign_key: "size_unit_id"
	belongs_to :created_by_user, class_name: "User", foreign_key: "created_by"
	belongs_to :updated_by_user, class_name: "User", foreign_key: "updated_by"

	default_scope -> { order('code') }

	validates :code, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }
	validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
	validates :size, :serving_size, :servings, numericality: {greater_than: 0}
	validates :size_unit_id, presence: true
	validates :energy, :protein, :fat, :carbohydrate, :sodium, numericality: {greater_than_or_equal_to: 0}
	validates :energy_percent, :protein_percent, :fat_percent, :carbohydrate_percent, :sodium_percent, 
			  numericality: { greater_than_or_equal_to: 0, only_integer: true}
	validates :created_by, presence: true
end
