require_relative "menu_methods"

toggle=nil

customer=nil
logout_attempts=0

while toggle!="q" && logout_attempts<=2
  

  if customer  == nil

      customer = create_account
  else
    puts "System will quit after 3rd Failed  login attempt"
    puts "Enter 2 to withdrawal\n"
  
    puts "Enter 3 to deposit\n"
  
    puts "Enter 4 to view transactions\n"
  
    puts "Enter 5 to view balance\n"

    puts "Enter 6 to transfer\n"
  
    puts "Enter q to quit\n"
  
    choice = gets.chomp
  
    if choice == "2"
  
      customer = withdrawal(customer)
      logout_attempts = customer.attempts
      next
      
  
    elsif choice == "3"
  
      customer = deposit(customer)
      logout_attempts = customer.attempts
  
      
  
    elsif choice == "4"
  
      customer = viewTransactions(customer)
      logout_attempts = customer.attempts
      
  
      next
    elsif choice == "5"
  
      customer = viewBalance(customer)
      logout_attempts = customer.attempts
      
      
  
    elsif choice == "6"
      customer = transfer(customer)
      logout_attempts = customer.attempts
  
  
    elsif choice == "q"
  
      toggle = "q"
  
    end
  end
end
puts "you have been logged out"
