class AddHostToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :host, foreign_key: { to_table: :users }
    add_reference :appointments, :guest, foreign_key: { to_table: :users }
    remove_column :appointments, :user_match_id
  end
end
