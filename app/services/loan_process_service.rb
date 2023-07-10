# frozen_string_literal: true

class LoanProcessService
  def initialize(name, lender, borrower_email, loan_type)
    @lender = lender
    @borrower_email = borrower_email
    @loan_type = loan_type
    @name = name
  end

  def create_loan
    token = generate_token
    loan = Loan.new(name: @name, lender: @lender, loan_type: @loan_type, token:)

    if loan.save
      create_documents(loan)

      LoanMailer.invite_email(loan, @email, token).deliver_now
      true
    else
      false
    end
  end

  private

  def generate_token
    SecureRandom.urlsafe_base64
  end

  def create_documents(loan)
    @loan_type.loan_document_types.each do |document_type|
      document_type.documents.create(loan:, file: document_type.template)
    end
  end
end
