class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.integer :school_class_id
      t.integer :primary_household_id
      t.integer :secondary_household_id

      t.timestamps
    end
  end
end
