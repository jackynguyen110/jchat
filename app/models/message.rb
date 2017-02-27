class Message < ApplicationRecord
	belongs_to :sender, class_name: 'User'
  	belongs_to :reciver, class_name: 'User'

  	def self.countUnredMessage(reciver_id,sender_id)
  		return Message.where(sender_id: sender_id).where(reciver_id: reciver_id).where(read_at: nil).count
  	end

  	def self.updateReadAt(reciver_id)
  		listUnreadMessage = Message.where(reciver_id: reciver_id).where(read_at: nil)
		listUnreadMessage.each do |m|
			m.read_at = Time.now
			m.save
		end
  	end
end
