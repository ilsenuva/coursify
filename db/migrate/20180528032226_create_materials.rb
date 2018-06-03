class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.string :file

      t.timestamps
    end
  end
end
