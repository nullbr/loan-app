# frozen_string_literal: true

json.array! @borrowers, partial: 'borrowers/borrower', as: :borrower
