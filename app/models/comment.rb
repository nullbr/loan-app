# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :document
  belongs_to :borrower, optional: true
  belongs_to :lender, optional: true
end
