# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :loan_document_type, dependent: :destroy

  belongs_to :loan
end
