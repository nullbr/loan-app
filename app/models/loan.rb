# frozen_string_literal: true

class Loan < ApplicationRecord
  #   Belongs_to borrower
  # Belongs_to lender
  # Belongs_to loan_type
  # Has_many comments
  # Has_many documents
  belongs_to :borrower, optional: true
  belongs_to :lender
  belongs_to :loan_type

  has_many :documents

  validates :name, presence: true
end
