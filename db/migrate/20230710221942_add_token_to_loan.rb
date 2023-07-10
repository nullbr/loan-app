# frozen_string_literal: true

class AddTokenToLoan < ActiveRecord::Migration[7.0]
  def change
    add_column :loans, :token, :string
  end
end
