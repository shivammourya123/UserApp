require 'httparty'

class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def fetch_product
    if Product.first.present?
      return redirect_to products_path
    end
          response = HTTParty.get("https://fakestoreapi.com/products")

      if response.success?
        products = response.parsed_response
        products.each do |product_data|
          Product.create(
            id: product_data["id"],
            title: product_data["title"],
            price: product_data["price"],
            description: product_data["description"],
            category: product_data["category"],
            image: product_data["image"],
            rating_rate: product_data["rating"]["rate"],
            rating_count: product_data["rating"]["count"]
          )
        end
        redirect_to products_path
      else
        puts "Failed to fetch data from API"
      end
  end
end
