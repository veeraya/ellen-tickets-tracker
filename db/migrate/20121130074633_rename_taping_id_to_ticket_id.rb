class RenameTapingIdToTicketId < ActiveRecord::Migration
  def up
    rename_column :ticket_status_changes, :taping_id, :ticket_id
  end

  def down
    rename_column :ticket_status_changes, :ticket_id, :taping_id
  end
end
