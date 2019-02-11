class RecipesController < ApplicationController

    def  new
        @recipe = Recipe.new
    end

    def  index
        @recipes = Recipe.all
    end

    def create
        @recipe = current_user.recipes.new(recipe_params)
        if @recipe.save
        redirect_to recipes_path, success: '投稿に成功しました'
        else
        flash.now[:danger] = "投稿に失敗しました"
        render :new
        end
    end

    def edit
        @recipe = Recipe.find_by(id: params[:id])
        
    end

    def  update
# binding.pry
    @recipe = Recipe.find_by(id: params[:id])
        @recipe.update(recipe_params)
        if @recipe.save
        redirect_to recipes_path, success: '投稿に成功しました'
        else
        flash.now[:danger] = "投稿に失敗しました"
        render :new
        end
    end


    def  destroy
        @recipe = Recipe.find_by(id: params[:id])
        @recipe.destroy
        redirect_to recipes_path, success: '投稿を削除しました'
    end

    private
    def recipe_params
        params.require(:recipe).permit(:main_image, :description, :name, :ingredient, :situation, :point)
    end

    def direction_params
        params.require(:direction).permit(:image, :comment)
    end

end
