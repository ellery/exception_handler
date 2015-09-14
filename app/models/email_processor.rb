class EmailProcessor
  
  def initialize(email)
    @email = email
  end

  def process
    a =  Subject.find_or_initialize_by(:subject => @email.subject, :to => @email.to)
    
    if a.messages.count > 0
      a.messages.create(:message => @email.body)
    else
      a.save
      SlackerService.new.send_slack("https://exceptionnotifcation.herokuapp.com/subject/"+ a.id.to_s, @email.to , @email.subject).deliver
      a.messages.create(:message => @email.body)
    end
    a.save!
  end
end
