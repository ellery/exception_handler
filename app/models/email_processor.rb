class EmailProcessor
  
  def initialize(email)
    @email = email
    Logger.error " HI i'm init"
  end

  def process
    Logger.error "ignore that moron i'mm the process "
    a =  Subject.find_or_initialize_by(:subject => @email.subject, :from => @email.from[:email])
    
    if a.messages.count > 0
      a.messages.create(:message => @email.body)
    else
      a.save!
      a.messages.create(:message => @email.body)
    end
    a.save!
  end
end
