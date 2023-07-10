# frozen_string_literal: true

class LoanType < ApplicationRecord
  has_many :loan, dependent: :destroy
end
