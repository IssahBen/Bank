require_relative "bank_account"
require_relative "transactions"
require_relative "customer"

module MenuMethods
  def create_customer
    puts "Enter your first name"
    first_name = gets.chomp

    puts "Enter your last name"
    last_name = gets.chomp

    puts "Enter  a new pin."
    pin = gets.chomp

    #move this into new validate function
    if (pin.length != 4) && (pin.scan(/[0-9]/i).size != 4)
      puts "Ensure your pin contains only numbers."
      return
    end
    #VALIDATE THIS BIT

    Customer.new(first_name, last_name, pin)
  end

  def create_customer_account(customer)
    puts "Enter name for account:"
    name = gets.chomp

    puts "Enter account type:"
    type = gets.chomp

    account = customer.create_account(type, name)

    if account[:error]
      puts account[:error]
    else
      puts "#{account[:account].name} has been successfully created!!"
    end
  end

  def deposit_or_withdraw(operation)

  end

  def deposit
    puts "Enter first name"
    first_name = gets.chomp

    puts "Enter your pin"
    pin = gets.chomp

    customer = customers.find { |customer| customer.first_name == first_name && customer.pin == pin }
    unless customer
      puts "Customer not found. \n"
      return
    end

    puts "Enter Account name"
    account_name = gets.chomp

    puts "Enter Account type"
    account_type = gets.chomp

    account = customer.bank_accounts.find { |account| account.name == account_name && account.type == account_type }
    unless account
      puts "Account not found. \n"
      return
    end

    puts "Enter Amount to deposit"
    amount = gets.chomp

    account.deposit amount

    puts "deposit successful your current balance is #{account.balance}"
  end

  def withdrawal(customer)

    puts "Enter your pin"

    pin = gets.chomp
    if pin == customer.pin

        puts "Enter withdrawal amount"

        withdrawal_amount = gets.chomp

        if withdrawal_amount.scan(/[a-z]/).size != 0
          puts "Invalid amount"
          return customer
        else

          transaction_object=Transaction.new("debit",withdrawal_amount.to_i)

          customer.bank_account.add_transaction(transaction_object)

          if customer.bank_account.balance<0

            p "Insufficient balance"

          else

            puts "Your balance is #{customer.bank_account.balance}"

          end

          return customer
        end
    else
      puts "Ivalid pin"

      customer.attempts += 1

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

  def reset_pin(customer)
        puts "Enter your pin"

      pin = gets.chomp

      if pin == customer.pin

        puts "Enter New pin"

        new_pin=gets.chomp

        customer.pin=new_pin
        return customer
      else
        puts "Invalid pin"

        customer.attempts+=1
        puts "try again"
        return customer
      end

  end
end