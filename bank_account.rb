require_relative "transactions"
class Account
    attr_accessor :balance,:transactions

    def initialize(name)

        @name = name

        @transactions  = []

        @balance = 0
    end


    def add_transaction(transaction_object)

        @transactions.push(transaction_object)

        @balance += transaction_object.amount

        return   @balance
      
        
    end
end




