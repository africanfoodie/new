class MessagesController < InheritedResources::Base
	
	def create
	if @message.save
  	flash[:notice] = 'Thanks for Your Message'
  	format.html { redirect_to root_path }
  end
end
end