class Subject < ActiveRecord::Base
  belongs_to :project
  has_many :messages
end
