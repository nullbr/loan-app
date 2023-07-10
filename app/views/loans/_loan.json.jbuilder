# frozen_string_literal: true

json.extract! loan, :id, :created_at, :updated_at
json.url loan_url(loan, format: :json)
