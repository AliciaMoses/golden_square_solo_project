require 'order'

RSpec.describe Order do 
   # submit_order
        #order_id
        #customer
        #items
        #time.now
    # view id
    xit "constructs" do
        fake_customer = double :customer 
        fake_menu = double :menu
        order = Order.new(fake_customer, fake_menu)
        expect(order.view_id).to eq 2
    end
     # view_menu
    it "allows users to view items on the menu" do
        fake_customer = double :customer 
        fake_menu_item = double :menu_item
        fake_menu = double :menu, add: nil
        allow(fake_menu).to receive(:available).and_return([fake_menu_item])
        order = Order.new(fake_customer, fake_menu)
        expect(order.available).to eq [fake_menu_item]
    end
    # select_item(string)
    it "allows users to select items and add them to an order" do
        fake_customer = double :customer 
        fake_menu_item = double :menu_item, available?: true
        fake_menu = double :menu, add: nil
        allow(fake_menu).to receive(:available).and_return([fake_menu_item])
        order = Order.new(fake_customer, fake_menu)
        #expect(order.available).to eq [fake_menu_item]
        order.select_item(fake_menu_item)
        expect(order.selected).to eq [fake_menu_item]
    end
    # remove item
    it "allows users to remove  items from an order" do
        fake_customer = double :customer 
        fake_menu_item = double :menu_item, available?: true
        fake_menu = double :menu, add: nil
        allow(fake_menu).to receive(:available).and_return([fake_menu_item])
        order = Order.new(fake_customer, fake_menu)
        #expect(order.available).to eq [fake_menu_item]
        order.select_item(fake_menu_item)
        order.remove_item(fake_menu_item)
        expect(order.selected).to eq []
    end
    # total
    it "keeps a running total of the cost of selected items" do
        fake_customer = double :customer 
        fake_menu_item = double :menu_item, price: 1, available?: true
        fake_menu_item_2 = double :menu_item, price: 3, available?: true
        fake_menu = double :menu, add: nil
        allow(fake_menu).to receive(:available).and_return([fake_menu_item, fake_menu_item_2])
        order = Order.new(fake_customer, fake_menu)
        order.select_item(fake_menu_item)
        order.select_item(fake_menu_item_2)
        expect(order.total).to eq 4
    end
    it "keeps a running total of the cost of selected items" do
        fake_customer = double :customer 
        fake_menu_item = double :menu_item, price: 1, available?: true
        fake_menu_item_2 = double :menu_item, price: 3, available?: true
        fake_menu = double :menu, add: nil
        allow(fake_menu).to receive(:available).and_return([fake_menu_item, fake_menu_item_2])
        order = Order.new(fake_customer, fake_menu)
        order.select_item(fake_menu_item)
        order.select_item(fake_menu_item_2)
        order.remove_item(fake_menu_item)
        expect(order.total).to eq 3
    end
    it "adds and lists the selected items in a readable format" do
            fake_customer = double :customer 
            fake_menu_item = double :menu_item, name: "fake_food", price: 1, available?: true
            fake_menu_item_2 = double :menu_item, name: "fake_food_2", price: 3, available?: true
            fake_menu = double :menu, add: nil
            allow(fake_menu).to receive(:available).and_return([fake_menu_item, fake_menu_item_2])
            order = Order.new(fake_customer, fake_menu)
            order.select_item(fake_menu_item)
            order.select_item(fake_menu_item_2)
            expect(order.review_order).to eq ["fake_food : £1", "fake_food_2 : £3", "total: £4"]
        end
        it "updates the order stauts from pending to submitted" do
            fake_customer = double :customer 
            fake_menu_item = double :menu_item, name: "fake_food", price: 1, available?: true
            fake_menu_item_2 = double :menu_item, name: "fake_food_2", price: 3, available?: true
            fake_menu = double :menu, add: nil
            allow(fake_menu).to receive(:available).and_return([fake_menu_item, fake_menu_item_2])
            order = Order.new(fake_customer, fake_menu)
            order.select_item(fake_menu_item)
            order.select_item(fake_menu_item_2)
            order.submit_order
            expect(order.view_status).to eq "submitted"
        end



    # selected to eq []
    # total to eq []

end
