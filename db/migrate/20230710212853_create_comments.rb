# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :content

      t.references :document, null: false, foreign_key: true
      t.references :borrower, foreign_key: true
      t.references :lender, foreign_key: true

      t.timestamps
    end
  end
end
