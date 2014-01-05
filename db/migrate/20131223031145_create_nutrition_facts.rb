class CreateNutritionFacts < ActiveRecord::Migration
  def change
    create_table :nutrition_facts do |t|
      t.string :code
      t.string :name
      t.integer :size_unit_id
      t.decimal :size
      t.decimal :serving_size
      t.decimal :servings
      t.decimal :energy
      t.integer :energy_percent
      t.decimal :protein
      t.integer :protein_percent
      t.decimal :fat
      t.integer :fat_percent
      t.decimal :carbohydrate
      t.integer :carbohydrate_percent
      t.decimal :sodium
      t.integer :sodium_percent
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    
    add_index :nutrition_facts, :code, unique: true
    add_index :nutrition_facts, :name, unique: true
  end
end
