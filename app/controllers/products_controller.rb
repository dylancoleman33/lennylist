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
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      redirect_to new_product_path
    end
  end

  def edit

   @product = Product.find(params[:id])
   puts "================================"
   puts @product.inspect
   puts "================================"

  end


    def update
      @product = Product.find(params[:id])
      @product.update_attributes(product_params)

      redirect_to products_path

    end

  def destroy
    @product =Product.find(params[:id]).destroy
    respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.'}
        format.json { head :no_content}
      end
  end

  # def product_params
  #   params.require(:product).permit(:title, :price, :description, :product_pic)
  # end
private 
  def product_params

    ({title: params[:product][:title], price:params[:product][:price], description: params[:product][:description], user_id: current_user.id, product_pic: params[:product][:product_pic]})
  end



end
