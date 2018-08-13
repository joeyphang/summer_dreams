class ProductsController < ApplicationController
	def index
		@product = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.user_id = current_user.id

		if @product.save
			redirect_to products_path
		else
			redirect_to new_product_path
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to product_path(@product)
		else
			redirect_to root_path
		end
	end

	def search
		@product = Product.all
        @product = @product.price_range(params[:from],params[:to]) if params[:from].present? || params[:to].present?
        filtering_params(params).each do |key, value|
        @product = @product.public_send(key, value) if value.present?
          end

          respond_to do |format|
              format.html
              format.js { render :layout => false }
              format.json { render json: @product }
          end 
	end

	def destroy
		@product = Product.find(params[:id])
    	@product.destroy
    	redirect_to products_path, :notice => "Product DELETED."
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :price, {avatar: []})
	end

	def filtering_params(params)
		params.slice(:title)
	end

end
