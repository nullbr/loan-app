# frozen_string_literal: true

class CreateBorrowers < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_digest

      t.references :loan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
