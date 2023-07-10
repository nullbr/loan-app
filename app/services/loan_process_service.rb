# frozen_string_literal: true

class LoanProcessService
  def initialize(lender, borrower_email, loan_type)
    @lender = lender
    @borrower_email = borrower_email
    @loan_type = loan_type
  end

  def create_loan
    token = generate_token
    loan = Loan.new(lender: @lender, loan_type: @loan_type, token:)

    if loan.save
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
end
