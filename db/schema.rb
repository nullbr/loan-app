# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_710_221_942) do
  create_table 'borrowers', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password'
    t.string 'password_digest'
    t.integer 'loan_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['loan_id'], name: 'index_borrowers_on_loan_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'content'
    t.integer 'document_id', null: false
    t.integer 'borrower_id'
    t.integer 'lender_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['borrower_id'], name: 'index_comments_on_borrower_id'
    t.index ['document_id'], name: 'index_comments_on_document_id'
    t.index ['lender_id'], name: 'index_comments_on_lender_id'
  end

  create_table 'documents', force: :cascade do |t|
    t.string 'name'
    t.string 'file'
    t.integer 'loan_document_type_id', null: false
    t.integer 'loan_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['loan_document_type_id'], name: 'index_documents_on_loan_document_type_id'
    t.index ['loan_id'], name: 'index_documents_on_loan_id'
  end

  create_table 'lenders', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'loan_document_types', force: :cascade do |t|
    t.string 'template'
    t.integer 'loan_type_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['loan_type_id'], name: 'index_loan_document_types_on_loan_type_id'
  end

  create_table 'loan_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'loans', force: :cascade do |t|
    t.string 'name'
    t.integer 'borrower_id'
    t.integer 'lender_id', null: false
    t.integer 'loan_type_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'token'
    t.index ['borrower_id'], name: 'index_loans_on_borrower_id'
    t.index ['lender_id'], name: 'index_loans_on_lender_id'
    t.index ['loan_type_id'], name: 'index_loans_on_loan_type_id'
  end

  add_foreign_key 'borrowers', 'loans'
  add_foreign_key 'comments', 'borrowers'
  add_foreign_key 'comments', 'documents'
  add_foreign_key 'comments', 'lenders'
  add_foreign_key 'documents', 'loan_document_types'
  add_foreign_key 'documents', 'loans'
  add_foreign_key 'loan_document_types', 'loan_types'
  add_foreign_key 'loans', 'borrowers'
  add_foreign_key 'loans', 'lenders'
  add_foreign_key 'loans', 'loan_types'
end
