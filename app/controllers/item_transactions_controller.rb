class ItemTransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = ItemTransaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = ItemTransaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    temp = transaction_params
    temp[:user_id] = current_user.id
    temp[:borrow_date] = DateTime.now
    
    to_borrow = MovieItem.find_by(id: temp[:movie_item_id])
    if to_borrow.nil?
      format.json { render json: {message: "Invalid Movie Item ID!"}, status: :unprocessable_entity }
    elsif !to_borrow.in_store? 
      format.json { render json: {message: "Movie Item is unavailable!"}, status: :unprocessable_entity }
    else
      @transaction = ItemTransaction.new(temp)
      respond_to do |format|
        if @transaction.save
          format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
          format.json { render :show, status: :created, location: @transaction }
        else
          format.html { render :new }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      temp = transaction_params
      temp[:user_id] = current_user.id
      temp[:return_date] = DateTime.now
      if @transaction.update(temp)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = ItemTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:item_transaction).permit(:movie_id)
    end
end
