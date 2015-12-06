class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.where(:active => true) 
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.create(supplier_params)
    flash[:success] = "Supplier successfully created!"
    redirect_to "/suppliers/#{@supplier.id}"
  end

  def edit
    @supplier = Supplier.find_by(id: params[:id])
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.update(supplier_params)
    redirect_to "/suppliers/#{@supplier.id}"
  end

  def destroy
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.update(:active => false)
    flash[:success] = "Supplier successfully removed!"
    redirect_to '/suppliers'
  end

  private

  def supplier_params
    params.require(:supplier, :name).permit(:email, :phone_number)
  end

end
