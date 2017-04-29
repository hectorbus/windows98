class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :autor
      t.text :description
      t.integer :appType

      t.timestamps
    end
  end
end
