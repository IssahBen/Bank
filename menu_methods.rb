require_relative "bank_account"
require_relative "transactions"
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

  transaction_object = Transaction.new("credit",deposit)

  customer.bank_account.add_transaction(transaction_object)

  p customer.bank_account.balance

  return customer
end

def withdrawal(customer)

  puts "Enter your pin"

  pin = gets.chomp
  if pin == customer.pin

    puts "Enter withdrawal amount"

    withdrawal_amount = gets.chomp.to_i

    transaction_object=Transaction.new("debit",withdrawal_amount)

    customer.bank_account.add_transaction(transaction_object)
  
    if customer.bank_account.balance<0
  
      p "Insufficient balance"
  
    else
  
      puts "Your balance is #{customer.bank_account.balance}"
  
    end
  
    return customer
  else
    puts "Ivalid pin"

    customer.attempts += 1

    puts "try again"

    return customer
  end


end

def deposit(customer)

  puts "Enter your pin"

  pin=gets.chomp

  if pin == customer.pin

    puts "Enter deposit amount"

    deposit_amount = gets.chomp.to_i

    transaction_object = Transaction.new("credit",deposit_amount)

    customer.bank_account.add_transaction(transaction_object)

  puts "Your balance is #{customer.bank_account.balance}"

  return customer
  else
    puts "Invalid pin"

    customer.attempts+=1
    puts "try again"

    return customer

  end
end

def viewTransactions(customer)

  puts "Enter your pin"

  pin = gets.chomp

  if pin==customer.pin

    customer.bank_account.transactions.each_with_index do |transaction,index|

      p "#{index+1}.. Type: #{transaction.type} Amount:#{transaction.amount}"
    end


  else
    puts "Invalid pin"

    customer.attempts+=1

    puts "try again"

    return customer
  end
  
end

def viewBalance(customer)

  puts "Enter your pin"

  pin = gets.chomp

  if pin == customer.pin

    puts "Your balance is #{customer.bank_account.balance}"
  else

    puts "Invalid pin"

    customer.attempts+=1

    puts "try again"
    return customer
  end

end
def transfer(customer)
  puts "Enter your pin"

  pin = gets.chomp

  if pin == customer.pin

    puts "Enter the amount to transfer"

    transfer_amount = gets.chomp.to_i

    puts "Enter the account number to transfer to"

    account_number=gets.chomp

    transfer_transaction=Transaction.new("debit",transfer_amount)

    customer.bank_account.add_transaction(transfer_transaction)

    puts "Your balance is #{customer.bank_account.balance}"

    return customer
  else
    puts "Invalid pin"

    customer.attempts+=1
    puts "try again"
    return customer
  end
end