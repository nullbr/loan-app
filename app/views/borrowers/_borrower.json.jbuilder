# frozen_string_literal: true

json.extract! borrower, :id, :created_at, :updated_at
json.url borrower_url(borrower, format: :json)
