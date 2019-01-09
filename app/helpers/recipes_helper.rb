module RecipesHelper

  #def options_of_recipe_ingredients
  #  ["Lily","Sunflower"]
  #end


  def options_of_recipe_ingredients
      flower_choices = []
      @flowers.each do |flower|
        flower_choices.push(flower.flower_name)
      end
      flower_choices
  end

end
