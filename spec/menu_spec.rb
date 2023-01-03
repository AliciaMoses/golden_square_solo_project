require 'menu'


RSpec.describe Menu do
    it "constructs" do
        menu_1 = Menu.new
        expect(menu_1.show_all).to eq []
    end 
    it "adds and lists all menu items" do 
        menu_1 = Menu.new
        fake_menu_item_1 = double :menu_item
        fake_menu_item_2 = double :menu_item
        menu_1.add(fake_menu_item_1)
        menu_1.add(fake_menu_item_2)
        expect(menu_1.show_all).to eq [fake_menu_item_1, fake_menu_item_2]
    end
    it "adds and lists all available menu items" do 
        menu_1 = Menu.new
        fake_menu_item_1 = double :menu_item, available?: false
        fake_menu_item_2 = double :menu_item, available?: false
        menu_1.add(fake_menu_item_1)
        menu_1.add(fake_menu_item_2)
        expect(menu_1.available).to eq []
    end

end