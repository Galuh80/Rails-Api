class Api::V1::ArticlesController < ApplicationController

    def index
        articles = Article.all
        render json: articles, status: 200
    end

    def show
        article = Article.find(params[:id])
        if article
            render json: article, status: 200
        else
            render json: {error: "article not found"}, status: 404
        end
    end

    def create
        article = Article.new(
            title: params[:title],
            url: params[:url],
            source_id: params[:source_id],
            category_id: params[:category_id]
        )
        if article.save
            render json: article, status: 200
        else
            render json: {error: "article failed to create"}, status: 500
        end
    end

    def update
        article = Article.find(params[:id])
        if article
            article.update(
                title: params[:title],
                url: params[:url],
                source_id: params[:source_id],
                category_id: params[:category_id]
            )
            render json: article, status: 200
        else
            render json: {error: "article failed to created"}, status: 500
        end
    end

    def destroy
        article = Article.find(params[:id])
        if article
            article.destroy
            render json: {success: "article has been destroy"}, status: 200
        end
    end
end
