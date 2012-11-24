class CreateTicketStatusChanges < ActiveRecord::Migration
  def change
    create_table :ticket_status_changes do |t|
      t.string :from_status
      t.string :to_status
      t.integer :taping_id

      t.timestamps
    end

    add_index :ticket_status_changes, [:taping_id, :created_at]
  end
end
