class AddCourseIdToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_reference :materials, :course, foreign_key: true
  end
end
