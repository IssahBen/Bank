
class Transaction
  attr_accessor :amount ,:type
  def initialize(type,amount)

      if type=="debit"

          @amount = -amount.to_i
      else
        @amount = amount.to_i
      end
    @type=type

  end
end