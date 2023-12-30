require_relative "bank_account"
require_relative "Transactions"
require_relative "customer"

def create_account
  puts "Enter your first name"
  first_name = gets.chomp
  puts "Enter your last name"
  last_name = gets.chomp
  puts "Enter  a new pin"
  pin = gets.chomp
  puts "Enter a bank account type Savings/Chequing"
  bank_account = gets.chomp
  customer = Customer.new(first_name,last_name,pin,bank_account)
  puts "Enter a deposit amount"
  deposit = gets.chomp.to_i
  transobj = Transaction.new("debit",deposit)
  customer.bank_account.add_transaction(transobj)
  p customer.bank_account.balance
  return customer
end

def withdrawal(customer)
  puts "Enter your pin"
  pin=gets.chomp
  if pin == customer.pin
    puts "Enter withdrawal amount"
    withdrawal_amount = gets.chomp.to_i
    transobj=Transaction.new("credit",withdrawal_amount)
    customer.bank_account.add_transaction(transobj)
  end
  if customer.bank_account.balance<0
    p "Insufficient balance"
  else
    puts "Your balance is #{customer.bank_account.balance}"
  end
  return customer


end

def deposit(customer)
  puts "Enter your pin"
  pin=gets.chomp
  if pin==customer.pin
    puts "Enter deposit amount"
    deposit_amount=gets.chomp.to_i
    transobj=Transaction.new("debit",deposit_amount)
    customer.bank_account.add_transaction(transobj)
  end
  puts "Your balance is #{customer.bank_account.balance}"
  return customer
end

def viewTransactions(customer)
  puts "Enter your pin"
  pin=gets.chomp
  if pin==customer.pin
    customer.bank_account.transactions.each_with_index do |transaction,index|
      p "#{index+1}.. Type: #{transaction.type} Amount:#{transaction.amount}"
    end


  end
end

def viewBalance(customer)
  puts "Enter your pin"
  pin=gets.chomp
  if pin==customer.pin
    puts "Your balance is #{customer.bank_account.balance}"
  end
end

