class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.string :title
      t.text :content
      t.boolean :purchased, default: false
      t.boolean :requested, default: false
      t.references :user, foreign_key: true
      t.string :price
      t.string :picture

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
