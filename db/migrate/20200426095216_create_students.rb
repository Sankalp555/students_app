class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
    	t.string :name
    	t.string :phone
    	t.integer :marks
      t.timestamps
    end
  end
end
