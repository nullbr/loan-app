# frozen_string_literal: true

class LoanType < ApplicationRecord
  has_many :loans, dependent: :destroy
  has_many :loan_document_types, dependent: :destroy
end
