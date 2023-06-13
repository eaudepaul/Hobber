# frozen_string_literal: true

class AddStatusToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :status, :string, default: 'pending'
  end
end
