require_relative "transactions"
class Account
  attr_accessor :balance,:transactions, :type, :name

  def initialize(type, name)
    @type = type

    @name = name

    @transactions  = []

    @balance = 0
  end

  def deposit(amount)
    add_transaction Transaction.new("credit", amount)
  end

  def add_transaction(transaction_object)
    @transactions.push(transaction_object)

    @balance += transaction_object.amount

    return   @balance
  end
end