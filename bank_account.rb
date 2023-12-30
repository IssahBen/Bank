require_relative "Transactions"
class Account
    attr_accessor :balance,:transactions 
    def initialize(name)
        @name=name
        @transactions=[]
        @balance=0
    end


    def add_transaction(transobj)
        @transactions.push(transobj)
        @balance+=transobj.amount
        return   @balance
      
        
    end
end




