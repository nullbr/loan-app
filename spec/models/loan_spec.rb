# test Loan model and relationships

require 'rails_helper'

RSpec.describe Loan, type: :model do
  it 'is valid with valid attributes' do
    lender = Lender.create!(name: 'Lender 1')
    loan_type = LoanType.create!(name: 'Housing')
    expect(Loan.create!(name: 'Housing loan', lender:, loan_type:)).to be_valid
  end

  it 'is not valid without a name' do
    lender = Lender.create!(name: 'Lender 1')
    loan_type = LoanType.create!(name: 'Housing')
    expect(Loan.create(name: nil, lender:, loan_type:)).not_to be_valid
  end
end
