# frozen_string_literal: true

class Lender < ApplicationRecord
  has_many :borrowers
  has_many :loans
end
