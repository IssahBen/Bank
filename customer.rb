require_relative "bank_account"
require_relative "transactions"
class  Customer
    attr_accessor :bank_account,:pin,:attempts,:last_name, :account_code

    def initialize(first_name,last_name,pin,bank_account,account_code)
        @first_name =  first_name

        @last_name = last_name

        @pin = pin

        @account_code=account_code

        @bank_account  =  Account.new(bank_account)
        @attempts = 0
    end

end
