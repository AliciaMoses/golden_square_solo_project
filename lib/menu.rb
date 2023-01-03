class Menu
    def initialize
        @menu_items = []
    end 

    def add(menu_item)
        @menu_items << menu_item
    end

    def show_all
        return @menu_items
    end

    def available
        return @menu_items.select do | menu_item |
            menu_item.available?
        end
    end
end 