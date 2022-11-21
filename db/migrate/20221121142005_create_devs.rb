class CreateDevs < ActiveRecord::Migration[7.0]
  def change
    create_table :devs do |t|
      t.string :name
      t.text :skill
      t.string :photo_url
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
