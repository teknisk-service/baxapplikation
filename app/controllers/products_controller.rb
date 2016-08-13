class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
   def show
    @product = Product.find(params[:id])
  end


  def new
    @product = Product.new
  end
  
def create
    @product = Product.new(product_params)
 
    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product,
          :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created,
          :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product."
    end
  end
  
   def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to products_url
  end
end

private

    def product_params
      params.require(:product).permit(:name, :price)
    end



  


