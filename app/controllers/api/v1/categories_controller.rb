class Api::V1::CategoriesController < ApplicationController
    
    def index
        categories = Category.all
        render json: categories, status: 200
    end

    def show 
        category = Category.find(params[:id])
        if category
            render json: category, status: 200
        else
            render json: {error: "category not found"}
        end
    end

    def create
        category = Category.new(
            name: params["name"]
        )
        if category.save
            render json: category, status: 200
        else
            render json: {error: "product failed to created"}, status: 500
        end
    end

    def update
        category = Category.find(params[:id])
        if category
            category.update(
                name: params[:name]
            )
            render json: category, status: 200
        else
            render json: {error: "category failed to updated"}
        end
    end

    def destroy
        category = Category.find(params[:id])
        if category
            category.destroy
            render json: {success: "category has been destroy"}, status: 200
        end
    end
end
