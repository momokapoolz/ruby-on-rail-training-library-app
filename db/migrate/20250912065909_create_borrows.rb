class CreateBorrows < ActiveRecord::Migration[8.0]
  def change
    create_table :borrows do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :status

      t.timestamps
    end
  end
end
