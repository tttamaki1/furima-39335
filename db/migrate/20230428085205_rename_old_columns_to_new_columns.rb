class RenameOldColumnsToNewColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :last_name_kanji, :last_name
    rename_column :users, :first_name_kanji, :first_name
  end
end
