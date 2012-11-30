class RenameTicketStatusChangeToStatusChange < ActiveRecord::Migration
    def change
        rename_table :ticket_status_changes, :status_changes
    end 
end
