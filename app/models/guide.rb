class Guide < ApplicationRecord
  validates_presence_of :title, :content
  
  def self.if_published
    where(published: true)
  end
end
