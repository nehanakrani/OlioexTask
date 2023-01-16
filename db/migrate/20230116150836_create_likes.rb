class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :article, null: false
      t.timestamps
    end
  end
end
