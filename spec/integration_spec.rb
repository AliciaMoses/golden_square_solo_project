
require 'menu'
require 'menu_item'
require 'customer'
require 'order'


RSpec.describe "integration" do
    it "adds and returns all items in a menu" do 
        menu = Menu.new
        menu_item = MenuItem.new("chips", 1.99)
        menu.add(menu_item)
        expect(menu.show_all).to eq [menu_item]
    end
    it "adds and returns all available items in a menu" do 
        menu = Menu.new
        menu_item_1 = MenuItem.new("chips", 1.99)
        menu_item_2 = MenuItem.new("salad", 1.99)
        menu_item_1.mark_as_unavailable
        menu.add(menu_item_1)
        menu.add(menu_item_2)
        expect(menu.available).to eq [menu_item_2]
    end
    it "returns all available items in a menu" do
        customer_1 = Customer.new("Jane", "Doe", "janedoeishungry@email.com", "077777777777", "E44TT", 1 )
        taco_menu = Menu.new
        menu_item_1 = MenuItem.new("Vegetable Taco", 3.99)
        menu_item_2 = MenuItem.new("Gluten-free Taco", 4.99)
        menu_item_3 = MenuItem.new("Black bean salad", 2.99)
        taco_menu.add(menu_item_1)
        taco_menu.add(menu_item_2)
        taco_menu.add(menu_item_3)
        order_1 = Order.new(customer_1, taco_menu)
        expect(order_1.available).to eq [menu_item_1, menu_item_2, menu_item_3]
    end
    it "stores selected items in a list" do
        customer_1 = Customer.new("Jane", "Doe", "janedoeishungry@email.com", "077777777777", "E44TT", 1 )
        taco_menu = Menu.new
        menu_item_1 = MenuItem.new("Vegetable Taco", 3.99)
        menu_item_2 = MenuItem.new("Gluten-free Taco", 4.99)
        menu_item_3 = MenuItem.new("Black bean salad", 2.99)
        menu_item_4 = MenuItem.new("Corn on cob", 1.99)
        taco_menu.add(menu_item_1)
        taco_menu.add(menu_item_2)
        taco_menu.add(menu_item_3)
        taco_menu.add(menu_item_3)
        order_1 = Order.new(customer_1, taco_menu)
        order_1.select_item(menu_item_1)
        order_1.select_item(menu_item_2)
        expect(order_1.selected).to eq [menu_item_1, menu_item_2]
    end
    it "keeps a running total of selected items in a" do
        customer_1 = Customer.new("Jane", "Doe", "janedoeishungry@email.com", "077777777777", "E44TT", 1 )
        taco_menu = Menu.new
        menu_item_1 = MenuItem.new("Vegetable Taco", 3.99)
        menu_item_2 = MenuItem.new("Gluten-free Taco", 4.99)
        menu_item_3 = MenuItem.new("Black bean salad", 2.99)
        menu_item_4 = MenuItem.new("Corn on cob", 1.99)
        taco_menu.add(menu_item_1)
        taco_menu.add(menu_item_2)
        taco_menu.add(menu_item_3)
        taco_menu.add(menu_item_4)
        order_1 = Order.new(customer_1, taco_menu)
        order_1.select_item(menu_item_1)
        order_1.select_item(menu_item_2)
        expect(order_1.total).to eq 8.98
    end
    it "allows the user to remove an item from an order" do
        customer_1 = Customer.new("Jane", "Doe", "janedoeishungry@email.com", "077777777777", "E44TT", 1 )
        taco_menu = Menu.new
        menu_item_1 = MenuItem.new("Vegetable Taco", 3.99)
        menu_item_2 = MenuItem.new("Gluten-free Taco", 4.99)
        menu_item_3 = MenuItem.new("Black bean salad", 2.99)
        menu_item_4 = MenuItem.new("Corn on cob", 1.99)
        taco_menu.add(menu_item_1)
        taco_menu.add(menu_item_2)
        taco_menu.add(menu_item_3)
        taco_menu.add(menu_item_4)
        order_1 = Order.new(customer_1, taco_menu)
        order_1.select_item(menu_item_1)
        order_1.select_item(menu_item_2)
        order_1.select_item(menu_item_3)
        order_1.remove_item(menu_item_2)
        expect(order_1.selected).to eq [menu_item_1, menu_item_3]
    end
    it "allows the user view an itemised list and a total in a readable format" do
        customer_1 = Customer.new("Jane", "Doe", "janedoeishungry@email.com", "077777777777", "E44TT", 1 )
        taco_menu = Menu.new
        menu_item_1 = MenuItem.new("Vegetable Taco", 3.99)
        menu_item_2 = MenuItem.new("Gluten-free Taco", 4.99)
        menu_item_3 = MenuItem.new("Black bean salad", 2.99)
        menu_item_4 = MenuItem.new("Corn on cob", 1.99)
        taco_menu.add(menu_item_1)
        taco_menu.add(menu_item_2)
        taco_menu.add(menu_item_3)
        taco_menu.add(menu_item_4)
        order_1 = Order.new(customer_1, taco_menu)
        order_1.select_item(menu_item_1)
        order_1.select_item(menu_item_2)
        order_1.select_item(menu_item_3)
        order_1.select_item(menu_item_4)
        expect(order_1.review_order).to eq ["Vegetable Taco : £3.99",
        "Gluten-free Taco : £4.99",
        "Black bean salad : £2.99",
        "Corn on cob : £1.99",
        "total: £13.96"]
    end
    it "returns a prompt when an order is submitted" do
        customer_1 = Customer.new("Jane", "Doe", "janedoeishungry@email.com", "077777777777", "E44TT", 1 )
        taco_menu = Menu.new
        menu_item_1 = MenuItem.new("Vegetable Taco", 3.99)
        menu_item_2 = MenuItem.new("Gluten-free Taco", 4.99)
        menu_item_3 = MenuItem.new("Black bean salad", 2.99)
        menu_item_4 = MenuItem.new("Corn on cob", 1.99)
        taco_menu.add(menu_item_1)
        taco_menu.add(menu_item_2)
        taco_menu.add(menu_item_3)
        taco_menu.add(menu_item_4)
        order_1 = Order.new(customer_1, taco_menu)
        order_1.select_item(menu_item_1)
        order_1.select_item(menu_item_2)
        order_1.select_item(menu_item_3)
        order_1.select_item(menu_item_4)
        expect(order_1.submit_order).to eq "Thank you, your order has been submitted"
    end
    it "updates the status of the order to submitted upon submission" do
        customer_1 = Customer.new("Jane", "Doe", "janedoeishungry@email.com", "077777777777", "E44TT", 1 )
        taco_menu = Menu.new
        menu_item_1 = MenuItem.new("Vegetable Taco", 3.99)
        menu_item_2 = MenuItem.new("Gluten-free Taco", 4.99)
        menu_item_3 = MenuItem.new("Black bean salad", 2.99)
        menu_item_4 = MenuItem.new("Corn on cob", 1.99)
        taco_menu.add(menu_item_1)
        taco_menu.add(menu_item_2)
        taco_menu.add(menu_item_3)
        taco_menu.add(menu_item_4)
        order_1 = Order.new(customer_1, taco_menu)
        order_1.select_item(menu_item_1)
        order_1.select_item(menu_item_2)
        order_1.select_item(menu_item_3)
        order_1.select_item(menu_item_4)
        order_1.submit_order
        expect(order_1.view_status).to eq "submitted"
    end
    it "creates a timestamp upon order submission" do
        customer_1 = Customer.new("Jane", "Doe", "janedoeishungry@email.com", "077777777777", "E44TT", 1 )
        taco_menu = Menu.new
        menu_item_1 = MenuItem.new("Vegetable Taco", 3.99)
        menu_item_2 = MenuItem.new("Gluten-free Taco", 4.99)
        menu_item_3 = MenuItem.new("Black bean salad", 2.99)
        menu_item_4 = MenuItem.new("Corn on cob", 1.99)
        taco_menu.add(menu_item_1)
        taco_menu.add(menu_item_2)
        taco_menu.add(menu_item_3)
        taco_menu.add(menu_item_4)
        order_1 = Order.new(customer_1, taco_menu)
        order_1.select_item(menu_item_1)
        order_1.select_item(menu_item_2)
        order_1.select_item(menu_item_3)
        order_1.select_item(menu_item_4)
        order_1.submit_order
        expect(order_1.order_time).to be
    end



end
        