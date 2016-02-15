class TransactionsController < ApplicationController
  http_basic_authenticate_with name: "scratch", password: "savvy", except: [:index, :show]

  def new
    @transaction = Transaction.new
  end
  
  def create
    @transaction = Transaction.new(transaction_params)
    
    if @transaction.save
      redirect_to @transaction
    else
      render 'new'
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def index
    @transactions = Transaction.all
  end

  def edit
    @transaction = Transactions.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    
    if @transaction.update(transaction_params)
      redirect_to @transaction
    else
      render 'edit'
    end
  end
  
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    
    redirect_to transactions_path
  end
  
  private
    def transaction_params
      params.require(:transaction).permit(:profile_id, :stock_id)
    end
end
