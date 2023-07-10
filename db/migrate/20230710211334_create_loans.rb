# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.string :name

      t.references :borrower, foreign_key: true
      t.references :lender, null: false, foreign_key: true
      t.references :loan_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
