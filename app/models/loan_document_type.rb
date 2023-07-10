# frozen_string_literal: true

class LoanDocumentType < ApplicationRecord
  belongs_to :loan_type, dependent: :destroy

  has_many :documents
end
