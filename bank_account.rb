require_relative "transactions"
require_relative 'models'
require 'pg'
class Account
    attr_accessor :balance,:transactions,:name,:type

    def initialize(type,name,id ,balance=0)
        conn = PG.connect(dbname:'Bank',user:'postgres',password:'postgres',host:'localhost')

        @transactions_table=Transactions.new(conn)
        @account_table=Accounts.new(conn)

        list =@transactions_table.pull_transaction_info(id)
        
        @transactions  = []

        unless list.empty?

            list.each do |transaction|
                @transactions << Transaction.new(*transaction)
            end
        end


        
        @name = name
        @type = type




        @balance = balance

        @id=id
    end

    def deposit(amount)
        add_transaction (Transaction.new("credit",amount))
    end

    def withdraw(amount,&block)
        if  amount.to_i <= @balance
            add_transaction(Transaction.new("debit",amount))
        else
             block.call
        end
    end
    private 

    def add_transaction(transaction_object)


        @transactions.push(transaction_object)
        @transactions_table.insert(@id,transaction_object.type,transaction_object.amount)

        @balance += transaction_object.amount

        @account_table.update_balance(@id,@name,@type,@balance)

        return   @balance


    end
end