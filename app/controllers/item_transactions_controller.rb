class ItemTransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    if is_admin?
      if params[:filter] == 'pending'
        @transactions = ItemTransaction.where(return_date: nil).order("borrow_date DESC")
      else
        @transactions = ItemTransaction.all.order("borrow_date DESC")
      end
    else
      if params[:filter] == 'pending'
        @transactions = ItemTransaction.where(user_id: current_user.id, return_date: nil).order("borrow_date DESC")
      else
        @transactions = ItemTransaction.where(user_id: current_user.id).order("borrow_date DESC")
      end
    end
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
    @transaction = ItemTransaction.new(temp)
    respond_to do |format|
      if is_suspended?
        fomat.html { render :new }
        format.json {render json: {message: "User account is suspended!"}, status: :unprocessable_entity }
      elsif to_borrow.nil?
        format.html { render :new }
        format.json { render json: {message: "Invalid Movie Item ID!"}, status: :unprocessable_entity }
      elsif (ItemTransaction.where(user_id: current_user.id, return_date: nil).count > 3)
        format.html { render :new }
        format.json { render json: {message: "You may only borrow up to 3 movies at a time!"}, status: :unprocessable_entity }
      elsif !to_borrow.in_store? 
        format.html { render :new }
        format.json { render json: {message: "Movie Item is unavailable!"}, status: :unprocessable_entity }
      else
        if @transaction.save
          to_borrow.update_attribute(:in_store, false)
          format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
          format.json { render json: {message: "Borrowed successfully!"}, status: :created }
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
      temp[:return_date] = DateTime.now
      if temp[:return_token] == @transaction.return_token
        movie_item = MovieItem.find_by(id: @transaction.movie_item_id)
        if movie_item.nil?
          format.html { render :edit }
          format.json { render json: {message: "Invalid Movie Item ID!"}, status: :unprocessable_entity }
        else
          if movie_item.in_store?
              format.html { render :edit }
              format.json { render json: {message: "Item has already been returned!" }, status: :unprocessable_entity}
          else
            if !movie_item.update_attribute(:in_store, true)
              format.html { render :edit }
              format.json { render json: movie_item.errors, status: :unprocessable_entity}
            end
            temp[:return_date] = DateTime.now
            if @transaction.update(temp)
              format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
              #format.json { render :show, status: :ok, location: @transaction }
              format.json { render json: {message: "Successfully returned item!"}}
            else
              format.html { render :edit }
              format.json { render json: @transaction.errors, status: :unprocessable_entity }
            end
          end
        end
      else
        format.json { render json: {message: "Invalid token!"}, status: :unprocessable_entity }
        format.html { render :edit }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to item_transactions_url, notice: 'Transaction was successfully destroyed.' }
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
      params.require(:item_transaction).permit(:movie_item_id, :return_token)
    end
end
