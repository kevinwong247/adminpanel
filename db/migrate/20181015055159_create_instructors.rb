class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.string :educationlevel
      t.integer :salary
      t.references :cohort
      t.timestamps
    end
  end
end
