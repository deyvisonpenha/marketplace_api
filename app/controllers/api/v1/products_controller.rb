class Api::V1::ProductsController < ApplicationController

before_action :set_product, only: [:show, :update, :destroy]

before_action :require_authorization!, only: [:create, :update, :destroy]

# GET /api/v1/products
# Listar todos os artigos
def index
    @products = Product.order('created_at DESC');
    render json: @products
    # render json: {status: 'SUCCESS', message:'Artigos carregados', data:articles},status: :ok
end

# GET /api/v1/products/1
def show
    render json: @product
end

# POST /api/v1/products
def create
    @product = product.new(product_params.merge(user: current_user))

    if @product.save
    render json: @product, status: :created
    else
    render json: @product.errors, status: :unprocessable_entity
    end
end

# PATCH/PUT /api/v1/products/1
def update
    if @product.update(product_params)
    render json: @product
    else
    render json: @product.errors, status: :unprocessable_entity
    end
end

# DELETE /api/v1/products/1
def destroy
    @product.destroy
end

private
# Use callbacks to share common setup or constraints between actions.
def set_product
@product = Product.find(params[:id])
end

# Only allow a trusted parameter "white list" through.
def product_params
params.require(:product).permit(:name, :price, :productType, :description, :tags)
end

def require_authorization!
unless current_user == @product.user
    render json: {}, status: :forbidden
end

end

end
