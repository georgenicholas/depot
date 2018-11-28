module CurrentCart

  private

    def set_cart
      @card = Card.find(session[:card_id])
    rescue
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
end
