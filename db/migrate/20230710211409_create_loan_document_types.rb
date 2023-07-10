# frozen_string_literal: true

class CreateLoanDocumentTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :loan_document_types do |t|
      t.string :template

      t.references :loan_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
