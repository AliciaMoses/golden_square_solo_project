class Order
   
    @@count = 0
    def initialize(customer, menu, order_status = "pending")
        @order_id = @@count += 1
        @selected = []
        @total = 0
        @order_status = order_status
        @menu = menu
        @customer = customer
        @order_time = nil 
    end
    def view_id
        return @order_id
    end
    def view_status
        return @order_status
    end
    def order_time
        return @order_time
    end
    def selected
        return @selected
    end

    def available
        return @menu.available
    end

    def select_item(menu_item)
        @selected << menu_item unless menu_item.available? == false
    end 


    def remove_item(menu_item)
           
           return @selected.delete(menu_item)
    
    end

    def total 
        return @selected.each do | menu_item |
           return @selected.sum(&:price)
        end
    end
    def review_order
        list = []
        @selected.map{|menu_item| list << "#{menu_item.name}" + " : " + "£" + "#{menu_item.price}"}
        list << "total: £#{@selected.sum(&:price)}"
       # for x in list do 
        #    return x end
    end


    def submit_order
        @order_time = Time.now
        @order_status = "submitted"
        return "Thank you, your order has been submitted"
    end 
end
