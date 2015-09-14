class EmailProcessor
  

  def  self.process(email)
    @email = email
    
    a =  Subject.find_or_initialize_by(:subject => @email.subject, :from => @email.from[:email])
    
    if a.messages.count > 0
      a.messages.create(:message => @email.body)
    else
      a.save
      a.messages.create(:message => @email.body)
    end
    a.save
  end
end
