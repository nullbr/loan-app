# frozen_string_literal: true

json.extract! lender, :id, :created_at, :updated_at
json.url lender_url(lender, format: :json)
