require_relative "bank_account"
require_relative "Transactions"
class  Customer
    attr_accessor :bank_account,:pin

    def initialize(first_name,last_name,pin,bank_account)
        @first_name =  first_name
        @last_name = last_name
        @pin = pin
        @bank_account  =  Account.new(bank_account)
    end

end
