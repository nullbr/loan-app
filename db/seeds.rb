# frozen_string_literal: true

require 'faker'

Lender.create!(name: Faker::Name.name)

# Housing, Personal and Bankruptcy Loan.
LoanType.create!([{ name: 'Housing' }, { name: 'Personal' }, { name: 'Bankruptcy' }])

# template for loan types
LoanDocumentType.create!([{ template: 'Housing', loan_type: LoanType.first },
                          { template: 'Personal', loan_type: LoanType.all[1] }, { template: 'Bankruptcy', loan_type: LoanType.last }])

Loan.create!(
  name: 'Housing loan',
  lender: Lender.first,
  loan_type: LoanType.first
)

Document.create!(name: 'Housing loan document', loan: Loan.first, loan_document_type: LoanDocumentType.first)

Comment.create!(content: 'Housing loan comment', document: Document.first, lender: Lender.first)
