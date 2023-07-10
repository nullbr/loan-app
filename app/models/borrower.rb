# frozen_string_literal: true

class Borrower < ApplicationRecord
  has_secure_password

  has_one :loan
  has_many :comments

  belongs_to :loan
end
