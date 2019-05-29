class Api::V1::ProductsController < Api::V1::ApiController

before_action :set_product, only: [:show, :update, :destroy]
before_action :verif_vendor, only: [:update]
before_action :require_authorization!, only: [:create, :update, :destroy]

# GET /api/v1/products
# Listar todos os artigos
def index
    @products = Product.order('created_at DESC');
    render json: @products
end

# GET /api/v1/products/1
def show
    render json: { product: @product}
    #render json: request.headers["X-User-Token"]
end

# POST /api/v1/products
def create
    @product = Product.new(product_params.merge(vendor: current_user.vendor))

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

def verif_vendor
    unless current_user.vendor == @product.vendor
        render json: {}, status: :forbidden
    end
end

def require_authorization!
    require_authentication!
end

end
