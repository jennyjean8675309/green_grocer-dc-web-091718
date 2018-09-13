require 'pry'

def consolidate_cart(cart)
  get_count = {}
  cart.each do |item|
    item.each do |item_name, price_info|
    count = 1
    if get_count.include?(item_name) == false
      get_count[item_name] = count
    else
      get_count[item_name] = count += 1
    end
    end
  end
  get_count
  consolidated_cart = {}
  cart.each do |item|
    item.each do |item_name, price_info|
      if consolidated_cart.include?(item) == false
        consolidated_cart[item_name] = price_info
      end
    end
  end
  consolidated_cart
  consolidated_cart.each do |item, price_info|
    if get_count.include?(item)
      consolidated_cart[item][:count] = get_count[item]
    end
  end
    consolidated_cart
end

def add_values_to_coupon(cart, coupons)
  cart_with_coupons = add_coupon_key(cart, coupons)
  cart_with_coupons.each do |item, pricing|
    coupons.each do |inc, value|
      if item == "#{inc[:item]} W/COUPON"
        pricing[:count] = cart[inc[:item]][:count] / inc[:num]
        pricing[:price] = inc[:cost] * pricing[:count]
      end
      if item == inc[:item]
        pricing[:count] = pricing[:count] % inc[:num]
      end
    end
  end
  cart_with_coupons
end

def apply_coupons(cart, coupons)
    cart.each do |item, pricing|
    coupons.each do |inc, value|
      if item == inc[:item] && (inc[:num] <= pricing[:count])
        cart["#{item} W/COUPON"] = pricing
      end
    end
  end
  binding.pry
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
