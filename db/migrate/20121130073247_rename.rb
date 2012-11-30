class Rename < ActiveRecord::Migration
    def change
        rename_table :tapings, :tickets
    end 
end
