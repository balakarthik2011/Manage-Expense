class RenameTitleToSpentFor < ActiveRecord::Migration[5.1]
  def change
    rename_column :expenses, :title, :spent_for
  end
end
