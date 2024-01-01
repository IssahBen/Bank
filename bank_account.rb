require_relative "transactions"
class Account
    attr_accessor :balance,:transactions,:name,:type

    def initialize(type,name)

        @name = name

        @transactions  = []

        @balance = 0
    end

    def deposit(amount)
        add_transaction (Transaction.new("credit",amount))
    end

    def withdraw(amount)
        add_transaction(Transaction.new("debit",amount))
    end

    def add_transaction(transaction_object)

        @transactions.push(transaction_object)

        @balance += transaction_object.amount

        return   @balance


    end
end