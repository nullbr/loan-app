# frozen_string_literal: true

class LoanMailer < ApplicationMailer
  def invite_email(loan, email, token)
    @loan = loan
    @invitation_link = "http://localhost:3000/loans/#{token}/accept"

    mail(to: email, subject: 'Loan Invitation')
  end
end
