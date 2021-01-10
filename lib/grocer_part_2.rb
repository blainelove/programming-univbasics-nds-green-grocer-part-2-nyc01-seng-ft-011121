require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  # binding.pry
  receipt = []
  if coupons == []
    return cart
  end
  cart.each do |product|
    coupons.each do |discounted|
      if product[:item] == discounted[:item]
        qty = product[:count]
        remain = product[:count] % discounted[:num]

        product[:count] = remain
        # binding.pry
        couponItemHash = {:item => product[:item] + ' W/COUPON',
                         :price => discounted[:cost] / discounted[:num],
                         :clearance => product[:clearance],
                         :count => qty - remain}
        receipt << couponItemHash
        # binding.pry
        # binding.pry
      end
    end
    receipt << product
  end
  return receipt
end



  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart


def apply_clearance(cart)
  cart.each do |product|
    product[:price] = (product[:price] * 0.80 if product[:clearance]).round
  end
end
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart


def checkout(cart, coupons)
  binding.pry
  total = 0
  conCart = consolidate_cart(cart)
  binding.pry
  coupCart = apply_coupons(conCart, coupons)
  binding.pry
  apply_clearance(coupCart)
  binding.pry
  coupCart.each do |product|
    total += product[:price] * product[:count]
  end
  if total > 100
    binding.pry
    total = total * 0.90
  end
  binding.pry
  return total
end


  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
