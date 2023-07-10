# frozen_string_literal: true

json.array! @lenders, partial: 'lenders/lender', as: :lender
