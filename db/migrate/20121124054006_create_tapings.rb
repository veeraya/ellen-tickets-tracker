class CreateTapings < ActiveRecord::Migration
  def change
    create_table :tapings do |t|
      t.datetime :taping_date
      t.string :ticket_status

      t.timestamps
    end
  end
end
