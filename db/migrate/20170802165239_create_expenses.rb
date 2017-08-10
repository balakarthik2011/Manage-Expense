class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :title
      t.float :amount
      t.text :note
      t.datetime :spent_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
