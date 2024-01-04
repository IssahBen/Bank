require_relative "bank_account"
require_relative "transactions"
require_relative "customer"

module Menumethods
  def create_customer

    puts "Enter your first name"

    first_name = gets.chomp

    puts "Enter your last name"

    last_name = gets.chomp



    puts "Enter  a new pin."

    pin = gets.chomp
    if (pin.length!=4) && (pin.scan(/[a-z]/i).size != 4)
      puts "Ensure your pin contain"
      return
    end


     Customer.new(first_name,last_name,pin)

  end
  def create_customer_account(customer)
    puts "Enter name for account:"

    name=gets.chomp

    puts "Enter account type"
    type=gets.chomp

    account=customer.create_account(type,name)

    if account[:error]
      puts account[:error]
    else
      puts "#{account[:account].name} has been successfully created "
    end

  end

  def withdrawal
    puts "Enter your first name"

    first_name=gets.chomp

    puts "Enter your pin"

    pin = gets.chomp

   customer=customers.find{|customer| customer.first_name=first_name && customer.pin==pin}

   unless customer
    puts "Customer not found"
    return
   end

   puts "Enter account name"
   account_name=gets.chomp

   puts "Enter account type"
   account_type=gets.chomp

   account=customer.bank_accounts.find{|account| account.name== account_name && account.type=account_type}

   unless account
    puts "Account not found"
    return
   end

   puts "Enter Amount to withdraw"

   amount=gets.chomp
   account.withdraw(amount){ p "Insufficient balance"}

   puts  "Your current Balance is #{account.balance}"
   

  end

  def deposit

    puts "Enter your first name"

    first_name=gets.chomp

    puts "Enter your pin"

    pin = gets.chomp

   customer=customers.find{|customer| customer.first_name==first_name && customer.pin==pin}

   unless customer
    puts "Customer not found"
    return
   end

   puts "Enter account name"
   account_name=gets.chomp

   puts "Enter account type"
   account_type=gets.chomp

   account=customer.bank_accounts.find{|account| account.name== account_name && account.type=account_type}

   unless account
    puts "Account not found"
    return
   end

   puts "Enter Amount to deposit"

   amount=gets.chomp
   account.deposit(amount)

   puts "Your current Balance is #{account.balance}"
   
  end

  def view_transactions
    puts "Enter your first name"
    first_name=gets.chomp

    puts "Enter your pin"

    pin = gets.chomp

   customer=customers.find{|customer| customer.first_name==first_name && customer.pin==pin}

   unless customer
    puts "Customer not found"
   end

   puts "Enter account name"
   account_name=gets.chomp

   puts "Enter account type"
   account_type=gets.chomp

   account=customer.bank_accounts.find{|account| account.name== account_name && account.type==account_type}

   unless account
    puts "Account not found"
    return
   end
   account.transactions.each_with_index do |transaction,index|
    puts "#{index}: type: #{transaction.type} amount: #{transaction.amount}"
   end

  end

  def view_balance
    puts "Enter your first_name"

    first_name=gets.chomp

    puts "Enter your pin"

    pin = gets.chomp

   customer=customers.find{|customer| customer.first_name==first_name && customer.pin==pin}

   unless customer
    puts "Customer not found"
   end

   puts "Enter account name"
   account_name=gets.chomp

   puts "Enter account type"
   account_type=gets.chomp

   account=customer.bank_accounts.find{|account| account.name== account_name && account.type==account_type}

   unless account
    puts "Account not found"
    return
   end

   puts "Your current balance is #{account.balance}"



  end
  def transfer
    first_name=gets.chomp

    puts "Enter your pin"

    pin = gets.chomp

   customer=customers.find{|customer| customer.first_name==first_name && customer.pin==pin}

   unless customer
    puts "Customer not found"
    return
   end

   puts "Enter account name"
   account_name=gets.chomp

   puts "Enter account type"
   account_type=gets.chomp

   account=customer.bank_accounts.find{|account| account.name== account_name && account.type==account_type}

   unless account
    puts "Account not found"
    return
   end

   puts "Enter Transfer receipient"

   receipient=gets.chomp

   puts "Transfer amount"

   transfer_amount=gets.chomp.to_i

   account.withdraw(transfer_amount)

   puts "Your current balance is #{account.balance}"




  end

  def reset_pin

    puts "Enter your fist name"
    first_name=gets.chomp

    puts "Enter your pin"

    pin = gets.chomp

   customer=customers.find{|customer| customer.first_name=first_name && customer.pin==pin}

   unless customer
    puts "Customer not found"
    return
   end
   puts "Enter new pin"

   new_pin=gets.chomp

   customer.pin= new_pin

   puts "Your new pin is #{customer.pin}"
  end
end