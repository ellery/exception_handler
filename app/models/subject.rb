class Subject < ActiveRecord::Base
  belongs_to :project
  has_many :messages
  
  
  def hit_count
    self.messages.count rescue "0"
  end

end
