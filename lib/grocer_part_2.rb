require_relative './part_1_solution.rb'

def apply_coupons(all_items, all_coupons)
    final_array = []
    h = Hash.new 0;
  all_coupons.length.times { | count |
    all_items.each {|i |
      # p i[:item]
      # this will check if there is a coupon name that maches what is in the cart && if the number of amount of the item qualifies it for the coupon
      if  i[:item] == all_coupons[count][:item] && i[:count] >= all_coupons[count][:num]
        the_difrence = i[:count] / all_coupons[count][:num]
          if i[:count] > all_coupons[count][:num]
          # add the count wich exceds the coupon limits to the new AH  
          h = i.clone
          h[:count] = the_difrence
          final_array.push(h)
          # p final_array
          i[:count] -= the_difrence
          # p i
          
          if  i[:count] == all_coupons[count][:num]
          h = i.clone
          h[:item] = "#{i[:item]} W/COUPON"
          h[:price] = (all_coupons[count][:cost] / all_coupons[count][:num]).round(2)
          final_array.push(h)
          
          end
          end
      end

      if  i[:item] != all_coupons[count][:item]
        h = i.clone
        final_array.push(h)
      end
    }
  }
  return final_array
end


def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
