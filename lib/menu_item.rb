class MenuItem 
    def initialize(name, price, available = true)
        @name = name
        @price = price
        @available = available

    end

    def name 
        return @name
    end
    
    def price
        return @price
    end

    def available?
        return @available
    end

    def mark_as_unavailable
        @available = false
    end 

    def mark_as_available
        @available = true
    end


end 