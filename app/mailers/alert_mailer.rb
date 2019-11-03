class AlertMailer < ApplicationMailer
		default from: 'henryzhou000@gmail.com'

	def alert
		@time=Time.now.getutc
		@owner_email = params[:owner_email]
		@device_name = params[:device_name]
		@error_message = params[:error_message]
		@error_type = params[:error_type]
		@url = params[:url]
		mail(to: @owner_email, subject: "Autonomous Trash Can "+@device_name+" threw a "+@error_type+" error")
	end
end
