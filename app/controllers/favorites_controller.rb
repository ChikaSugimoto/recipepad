class FavoritesController < ApplicationController

    def index
    @favorite_recipes = current_user.favorite_recipes
    end

    def create
        favorite = Favorite.new
        favorite.user_id = current_user.id
        favorite.recipe_id = params[:recipe_id]

        if favorite.save
            redirect_to recipes_path, success: 'お気に入りに登録しました'
        else
            redirect_to recipes_path, danger: 'お気に入りに登録に失敗しました'
        end
    end
end


