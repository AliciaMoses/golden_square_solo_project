class Customer 
        def initialize(forename, surname, email, mobile, delivery_postcode, delivery_door_number)
            @forename = forename
            @surname = surname
            @email = email
            @mobile = mobile
            @delivery_postcode = delivery_postcode
            @delivery_door_number = delivery_door_number
        end
        def name
            return "#{@forename + " " + @surname}"
        end 
        def email
            return @email
        end
        def mobile
            return @mobile
        end


    end