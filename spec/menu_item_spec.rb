require 'menu_item'

RSpec.describe MenuItem do
    it "constructs" do
        menu_item = MenuItem.new("chips", 1.99)
        expect(menu_item.name).to eq "chips"
    end
    it "constructs" do
        menu_item = MenuItem.new("chips", 1.99)
        expect(menu_item.price).to eq 1.99
    end
    it "constructs with a default value for available var " do
        menu_item = MenuItem.new("chips", 1.99)
        expect(menu_item.available?).to eq true
    end
    it "changes status item from available to unavailable" do
        menu_item = MenuItem.new("chips", 1.99)
        menu_item.mark_as_unavailable
        expect(menu_item.available?).to eq false
    end
    it "changes status item from unavailable to available" do
        menu_item = MenuItem.new("chips", 1.99)
        menu_item.mark_as_unavailable
        menu_item.mark_as_available
        expect(menu_item.available?).to eq true
    end

end