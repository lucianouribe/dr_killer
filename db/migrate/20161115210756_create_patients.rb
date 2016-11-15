class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :dying
      t.boolean :insurance
      t.string :complains_of

      t.timestamps
    end
  end
end
