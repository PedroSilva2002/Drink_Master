class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :drink, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
