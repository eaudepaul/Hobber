# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :address
      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :game, null: false, foreign_key: true
      t.references :user_match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
