class EmailProcessor
  
  def initialize(email)
    @email = email
  end

  def process
    a =  Subject.find_or_initialize_by(:subject => @email.subject, :to => @email.to[:email])
    
    if a.messages.count > 0
      a.messages.create(:message => @email.body)
    else
      a.save!
      a.messages.create(:message => @email.body)
    end
    a.save!
  end
end
