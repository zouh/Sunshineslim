class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :code
      t.string :name
      t.integer :unit_group_id

      t.timestamps
    end

    add_index :units, :code, unique: true
  end
end
