class CreateComputers < ActiveRecord::Migration[6.0]
  def change
    create_table :computers do |t|
      t.string :name
      t.string :processor
      t.integer :storage
      t.integer :ram
      t.integer :size

      t.timestamps
    end
  end
end
