class OrderData
    def initialize(order) # instance of order
    end

    def delivery_estimate
        # takes order time and returns delivery estimate as eta
    end 

    def send_sms

        require 'twilio-ruby'

        account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
        auth_token = "your_auth_token"  

        @client = Twilio::REST::Client.new account_sid, auth_token
    #   message = @client.messages.create(
    #     body: "Hello #{customer.name}, your food is on its way and should be with you by #{delivery_estimate}"
    #     to:  customer.mobile   
    #     from: "+15005550006")  
    #   puts message.sid


    end

end 