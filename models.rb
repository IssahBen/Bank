class User
    def initialize(conn)
        @conn=conn
    end

    def create_table
        @conn.exec("CREATE TABLE IF NOT EXISTS customers(id SERIAL PRIMARY KEY,first_name VARCHAR(50),last_name VARCHAR(50),pin VARCHAR(10) )")
    end

    def insert(first_name,last_name,pin)
        @conn.exec_params("INSERT INTO customers(first_name,last_name,pin) VALUES($1,$2,$3)",[first_name,last_name,pin])
    end

    def pull_pin(first_name,last_name)
        result=@conn.exec_params("SELECT pin FROM customers WHERE first_name=$1 AND last_name=$2",[first_name,last_name])
        result.values.flatten.first
    end
    

    def customer?(first_name,last_name)
        result=@conn.exec_params("SELECT first_name,last_name FROM customers WHERE first_name=$1 AND last_name=$2",[first_name,last_name])
        result=result.values
        if result.empty? 
            return false
        else
            true
        end
    end

    def pull_id(first_name,last_name,pin)
        result = @conn.exec_params("SELECT id FROM customers WHERE first_name=$1 AND last_name=$2 AND pin=$3",[first_name,last_name,pin] )
        return result.values.flatten.first
    end

    def update_pin(id,new_pin)
        @conn.exec_params("UPDATE customers SET  pin=$1 WHERE id=$2 ",[new_pin,id])
    end
end

class Accounts
    def initialize(conn)
        @conn = conn
    end

    def create_table
        @conn.exec("CREATE TABLE IF NOT EXISTS accounts( customer_id INTEGER REFERENCES customers(id),account_name VARCHAR(50),account_type VARCHAR(50), balance INT  )")
    end

    def insert(customer_id,account_name,account_type,balance=0)
        @conn.exec_params("INSERT INTO accounts (customer_id,account_name,account_type,balance) VALUES($1,$2,$3,$4)",[customer_id,account_name,account_type,balance])
    end

    def pull_balance(customer_id,account_name,account_type)
       result= @conn.exec_params("SELECT balance FROM accounts WHERE customer_id=$1,account_name=$2,account_type=$3",[customer_id,account_name,account_type])
       result=result.values.flatten.first
    end

    def pull_account_info(customer_id)
        result=@conn.exec_params("SELECT account_name,account_type,balance FROM accounts WHERE customer_id=$1",[customer_id])
        result.values
    end

    def update_balance(customer_id,account_name,account_type,new_balance)
        @conn.exec_params("UPDATE accounts SET balance=$1 WHERE customer_id=$2 AND account_name=$3 AND account_type=$4",[new_balance,customer_id,account_name,account_type])
    end


end

class Transactions
    def initialize(conn)
        @conn=conn
    end

     def  create_table
        @conn.exec("CREATE TABLE IF NOT EXISTS transactions(customer_id INTEGER REFERENCES customers(id),transaction_type VARCHAR(50),transaction_amount INTEGER )")
     end

     def insert(customer_id,transaction_type,transaction_amount)
        @conn.exec_params("INSERT INTO transactions(customer_id,transaction_type,transaction_amount) VALUES ($1,$2,$3)",[customer_id,transaction_type,transaction_amount])
     end

     def pull_transaction_info(customer_id)
        result=@conn.exec_params("SELECT transaction_type,transaction_amount FROM transactions WHERE customer_id=$1",[customer_id])
        result=result.values
     end
end


