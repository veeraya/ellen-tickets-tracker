class RenameTapingDateColumnToDate < ActiveRecord::Migration
  def up
    rename_column :tickets, :taping_date, :date
  end

  def down
    rename_column :tickets, :date, :taping_date
  end
end
