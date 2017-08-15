class CreateTableFusens < ActiveRecord::Migration[5.1]
  def change
    create_table :fusens do |t|
      t.string :title, null: false
      t.integer :x, null: false
      t.integer :y, null: false
    end
  end
end
