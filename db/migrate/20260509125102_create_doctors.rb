class CreateDoctors < ActiveRecord::Migration[8.1]
  def change
    create_table :doctors do |t|
      t.string :phone
      t.string :first_name
      t.string :last_name
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :doctors, :phone
  end
end
