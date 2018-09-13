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

def add_coupon_key(cart, coupons)
  cart_with_coupons = {}
  cart.each do |item_name, pricing_info|
    coupons.each do |inc, value|
      if item_name == inc[:item] && inc[:num] <= pricing_info[:count]
        cart_with_coupons["#{item_name} W/COUPON"] = pricing_info
        if cart[item_name][:count] != inc[:num] && cart[item_name][:count] % inc[:num] > 0 
          cart_with_coupons[item_name] = pricing_info
        end
          binding.pry
      
      elsif item_name == inc[:item] && inc[:num] > pricing_info[:count]
        cart_with_coupons[item_name] = pricing_info
      elsif item_name != inc[:item]
        cart_with_coupons[item_name] = pricing_info
      end
    end
  end

  cart_with_coupons
end

def apply_coupons(cart, coupons)
  add_coupon_key(cart, coupons)
 
  
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
