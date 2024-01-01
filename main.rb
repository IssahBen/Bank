require_relative "menu_methods"

toggle=nil

customers=[ ]
logout_attempts=0

while toggle!="q" && logout_attempts<=2


  if customers.empty?

    customers << create_account

  else
    puts "System will quit after 3rd Failed  login attempt"

    puts "Enter 1 to create account"

    puts "Enter 2 to withdrawal\n"

    puts "Enter 3 to deposit\n"

    puts "Enter 4 to view transactions\n"

    puts "Enter 5 to view balance\n"

    puts "Enter 6 to transfer\n"

    puts "Enter 7 to reset Pin"

    puts "Enter q to quit\n"

    choice = gets.chomp

    case choice
    when "1"

    end

    if choice == "1"
      customer = create_customer
      create_account(customer)

      customers << customer
    elsif choice == "2"
      puts "Enter last name"


      last_name = gets.chomp

      puts "Enter secret code"

      account_code = gets.chomp

      customer = nil

      customers.each do |customerx|
        if customerx.last_name == last_name && customerx.account_code == account_code
          customer = customerx
        end
      end


      customer = withdrawal(customer)
      logout_attempts = customer.attempts
      next

    elsif choice == "3"
      puts "Enter last name"

      last_name =  gets.chomp

      puts "Enter secret code"

      account_code = gets.chomp

      customer = nil

      customers.each do |customerx|

        if customerx.last_name == last_name && customerx.account_code == account_code

          customer = customerx
        end
      end

      customer = deposit(customer)
      logout_attempts = customer.attempts

    elsif choice == "4"
      puts "Enter last name"

      last_name  = gets.chomp

      puts "Enter secret code"

      account_code = gets.chomp

      customer = nil

      customers.each do |customerx|
        if customerx.last_name == last_name && customerx.account_code == account_code

          customer = customerx
        end
      end

      customer = viewTransactions(customer)
      logout_attempts = customer.attempts


      next
    elsif choice == "5"
      puts "Enter last name"


      last_name = gets.chomp

      puts "Enter secret code"

      account_code = gets.chomp

      customer = nil

      customers.each do |customerx|

        if customerx.last_name == last_name && customerx.account_code == account_code

          customer = customerx
        end
      end

    elsif choice == "6"
      puts "Enter last name"


      last_name = gets.chomp

      puts "Enter secret code"

      account_code = gets.chomp

      customer = nil

      customers.each do |customerx|

        if customerx.last_name == last_name && customerx.account_code == account_code

          customer = customerx
        end
      end
      customer = transfer(customer)
      logout_attempts = customer.attempts


    elsif choice == "7"
      puts "Enter last name"

      last_name = gets.chomp

      puts "Enter secret code"

      account_code = gets.chomp

      customer = nil

      customers.each do |customerx|

        if customerx.last_name == last_name && customerx.account_code == account_code

          customer = customerx
        end
      end
      customer = reset_pin(customer)
      logout_attempts = customer.attempts

    elsif choice == "q"

      toggle = "q"

    end
  end
end
puts "you have been logged out"


def handle_menu_option_1

end
