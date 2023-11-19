# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    puts "User: #{user.inspect}"
    can :public_recipes, Recipe
    can :read, Recipe, public: true
    return unless user.present?

    can :manage, Recipe, users_id: user.id
  end
end
