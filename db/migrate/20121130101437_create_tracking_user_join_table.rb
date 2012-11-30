class CreateTrackingUserJoinTable < ActiveRecord::Migration
  def change
    create_table :trackings_users, :id => false do |t|
      t.integer :tracking_id
      t.integer :user_id
    end

    add_index :trackings_users, [ :tracking_id, :user_id ], :unique => true, :name => 'by_tracking_and_user'
  end
end
