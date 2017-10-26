class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = current_user.expenses.all
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = current_user.expenses.new
    respond_to do |format|
      format.js { render :new }
    end
  end

  # GET /expenses/1/edit
  def edit
    respond_to do |format|
      format.js { render :edit }
    end
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = current_user.expenses.new(expense_params)

    respond_to do |format|
      if @expense.save
        @expenses = current_user.expenses
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
        format.js   { render 'expenses.js.erb' }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
        format.js   { render 'error.js.erb' }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        @expenses = current_user.expenses
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
        format.js   { render 'expenses.js.erb' }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
        format.js   { render 'error.js.erb' }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    @expenses = current_user.expenses
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render 'expenses.js.erb' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = current_user.expenses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:spent_for, :amount, :note, :spent_at)
    end
end
