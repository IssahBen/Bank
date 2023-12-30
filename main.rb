require_relative "menumethods"

toggle=nil

customer=nil

while toggle!="q"

  if customer  == nil
    puts "Enter 1 to create a new account"

    choice=gets.chomp
    if choice == "1"
      customer = create_account
    end
  end
  puts "Enter 2 to withdrawal"
  puts "Enter 3 to deposit"
  puts "Enter 4 to view transactions"
  puts "Enter 5 to view balance"
  puts "Enter q to quit"

  choice=gets.chomp

  if choice == "2"
    customer=withdrawal(customer)

  elsif choice == "3"
    customer=deposit(customer)
    next

  elsif choice == "4"
    viewTransactions(customer)
    next
  elsif choice == "5"
    viewBalance(customer)
    next 


  elsif choice == "q"
    toggle = "q"
  end
end



