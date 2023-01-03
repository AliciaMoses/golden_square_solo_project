```ruby

class Customer
    def initialize(forename, surname)
    end 
end 

class MenuItem
    def initialize(name, price, status)
    end
end

class Menu
    def initialize
    end

    def add(menu_item) # instance of MenuItem
    end

    def all
        #returns all menu items
    end

    def all_available
        #returns all menu items filtered by status
    end
end

class Order
    def initialize
    end

    def view_menu # return available dishes
    end 

    def add
    end 

    def remove
    end

    def review_order
    end 

    def submit_order
    end 

end 

class OrderData
    def initialize
    end 

    def pending_orders 
        @orders << order 
         when added, send_sms
    end 
    
    def view_order
    end 

    def send_sms_confirmation
    end 
end 