class Account

  STANDARD_VALIDITY_YRS = 5
  attr_accessor :pin_number, :status, :exp_date

  def initialize
    @pin_number = create_pin_number
    @exp_date = exp_date_create
    @status = :active
  end

  
  def create_pin_number
    rand(1000..9999)
  end

  def exp_date_create
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end
end
