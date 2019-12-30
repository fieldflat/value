class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :room, foreign_key: true
      t.integer :from_id
      t.integer :to_id
      t.text :content

      t.timestamps
    end
  end
end
