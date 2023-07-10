# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :file

      t.references :loan_document_type, null: false, foreign_key: true
      t.references :loan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
