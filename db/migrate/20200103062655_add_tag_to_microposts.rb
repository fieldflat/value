class AddTagToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :tag, :string
  end
end
