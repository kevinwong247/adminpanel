class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :startdate
      t.date :enddate
      t.references :course
      t.timestamps
    end
  end
end
