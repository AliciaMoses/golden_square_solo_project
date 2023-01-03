require 'customer'

RSpec.describe Customer do
    it "constructs" do
        customer_1 = Customer.new("Jane", "Doe", "janedoeishungry@email.com", "07999888777",  "E44TT", 1)
        expect(customer_1.name).to eq "Jane Doe"
    end
    it "constructs" do
        customer_1 = Customer.new("Jane", "Doe", "janedoeishungry@email.com", "07999888777", "E44TT", 1)
        expect(customer_1.email).to eq "janedoeishungry@email.com"
    end
    it "constructs" do
        customer_1 = Customer.new("Jane", "Doe",  "janedoeishungry@email.com", "07999888777", "E44TT", 1)
        expect(customer_1.mobile).to eq "07999888777"
    end
end