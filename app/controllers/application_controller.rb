class ApplicationController < ActionController::Base
  before_filter :get_recipes

  protect_from_forgery

  private

  def get_recipes
    @recipes_by_category = {}
    Recipe::CATEGORIES.each { |category| @recipes_by_category[category] = Recipe.where(:category => category) }
    @recipes = Recipe.all
  end
end
