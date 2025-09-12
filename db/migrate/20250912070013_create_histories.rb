class CreateHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :status
      t.date :borrow_date
      t.date :return_date

      t.timestamps
    end
  end
end
