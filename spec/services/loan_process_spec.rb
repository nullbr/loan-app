require 'rails_helper'

RSpec.describe LoanProcessService do
  let(:name) { 'Loan Test' }
  let(:lender) { Lender.create(name: 'Lender 1') }
  let(:borrower_email) { 'borrower@example.com' }
  let(:loan_type) { LoanType.create(name: 'Housing') }
  let(:loan_process_service) { described_class.new(name, lender, borrower_email, loan_type) }

  describe '#create_loan' do
    context 'when loan creation is successful' do
      let(:loan) { instance_double(Loan, save: true) }

      before do
        allow(Loan).to receive(:new).and_return(loan)
        allow(loan).to receive(:save).and_return(true)
        allow(loan_process_service).to receive(:create_documents)
        allow(LoanMailer).to receive_message_chain(:invite_email, :deliver_now)
      end

      it 'creates a loan, creates documents, sends an invitation email, and returns true' do
        expect(loan_process_service.create_loan).to be true
        expect(loan).to have_received(:save)
        expect(loan_process_service).to have_received(:create_documents).with(loan)
        expect(LoanMailer).to have_received(:invite_email).with(loan, borrower_email, an_instance_of(String)).once
      end
    end

    context 'when loan creation fails' do
      before do
        allow(Loan).to receive(:new).and_return(Loan.new)
        allow_any_instance_of(Loan).to receive(:save).and_return(false)
        allow(LoanMailer).to receive(:invite_email)
      end

      it 'does not create documents, does not send an invitation email, and returns false' do
        expect(loan_process_service.create_loan).to be false
        expect(LoanMailer).not_to have_received(:invite_email)
      end
    end
  end
end
