class CreateUnitGroups < ActiveRecord::Migration
  def change
    create_table :unit_groups do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
    add_index :unit_groups, :code, unique: true
  end
end
