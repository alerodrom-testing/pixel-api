class CreatePixels < ActiveRecord::Migration[6.0]
  def change
    create_table :pixels do |t|
      t.integer :axis_x
      t.integer :axis_y
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
