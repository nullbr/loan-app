# frozen_string_literal: true

class BorrowersController < ApplicationController
  before_action :set_borrower, only: %i[show edit update destroy]

  # GET /borrowers or /borrowers.json
  def index
    @borrowers = Borrower.all
  end

  # GET /borrowers/1 or /borrowers/1.json
  def show; end

  # GET /borrowers/new
  def new
    @borrower = Borrower.new
  end

  # GET /borrowers/1/edit
  def edit; end

  # POST /borrowers or /borrowers.json
  def create
    @borrower = Borrower.new(borrower_params)

    respond_to do |format|
      if @borrower.save
        format.html { redirect_to borrower_url(@borrower), notice: 'Borrower was successfully created.' }
        format.json { render :show, status: :created, location: @borrower }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @borrower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrowers/1 or /borrowers/1.json
  def update
    respond_to do |format|
      if @borrower.update(borrower_params)
        format.html { redirect_to borrower_url(@borrower), notice: 'Borrower was successfully updated.' }
        format.json { render :show, status: :ok, location: @borrower }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @borrower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrowers/1 or /borrowers/1.json
  def destroy
    @borrower.destroy

    respond_to do |format|
      format.html { redirect_to borrowers_url, notice: 'Borrower was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_borrower
    @borrower = Borrower.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def borrower_params
    params.fetch(:borrower, {})
  end
end
