class RenameTicketStatusColumnToStatus < ActiveRecord::Migration
  def up
    rename_column :tickets, :ticket_status, :status
  end

  def down
    rename_column :tickets, :status, :ticket_status
  end
end
