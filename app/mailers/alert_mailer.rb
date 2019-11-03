class AlertMailer < ApplicationMailer
		default from: 'henryzhou000@gmail.com'

	def alert
		@owner_email = params[:owner_email]
		@device_name = params[:device_name]
		@error_message = params[:error_message]
		mail(to: @owner_email, subject: @error_message)
	end
end
