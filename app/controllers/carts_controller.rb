class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  def destroy
    @cart.cart_items.destroy_all
    redirect_to action: :show
  end

  def add_to_cart
    drink = Drink.find(params[:drink_id])

    cart_item = @cart.cart_items.find_or_initialize_by(drink: drink)

    cart_item.quantity = (cart_item.quantity || 0) + 1
    cart_item.save!
  end

  def remove_item_from_cart
    drink = Drink.find(params[:drink_id])

    cart_item = @cart.cart_items.find_by(drink: drink)

    if cart_item
      cart_item.destroy!
      redirect_to action: :show
    end
  end

  private
    def set_cart
      @cart = Current.session.user.cart
    end
end
