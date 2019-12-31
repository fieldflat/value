class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :micropost, foreign_key: true
      t.integer :value
      t.text :comment
      t.integer :from_id
      t.integer :to_id

      t.timestamps
    end
  end
end
