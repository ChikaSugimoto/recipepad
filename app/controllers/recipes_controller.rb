class RecipesController < ApplicationController

    def  new
        @recipe = Recipe.new
    end

    def  index
        @recipes = Recipe.all.includes(:favorite_users, :directions)
        
    end

    def create

        # direction1 = Direction.new
        # direction1.recipe_id = 44
        # direction1.number = 1
        # direction1.comment = "test"
        # direction1.image = "tes"
        # direction1.save!




        @recipe = current_user.recipes.new(recipe_params)
        if @recipe.save
            unless params["direction1"].empty?
                direction1 = Direction.new
                direction1.recipe_id = @recipe.id
                direction1.number = 1
                direction1.comment = params["direction1"]["comment"]
                direction1.image = params["direction1"]["image"]
                 binding.pry
                if direction1.save
                    direction2 = Direction.new
                    direction2.recipe_id = @recipe.id
                    direction2.number = 1
                    direction2.comment = params["direction1"]["comment"]
                    direction2.image = params["direction1"]["image"]
                if direction2.save
    
                    # redirect_to recipes_path, success: '投稿に成功しました'
                    render :new 
                else
                    flash.now[:danger] = "投稿に失敗しました"
                    render :new 
                    
                end
            end
        end
    end

    def edit
        @recipe = Recipe.find_by(id: params[:id])
        
    end

    def  update
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
        params.require(:recipe).permit(:main_image, :description, :name, :ingredient, :situation, :point, :user_id)
    end
    #private
    # def direction1_params
    #     params.require(:direction).permit(:comment, :image)
    # end

end
end