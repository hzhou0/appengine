class AlertMailer < ApplicationMailer
		default from: 'henryzhou000@gmail.com'

	def alert
		@time=params[:time]
		@time_zone=params[:time_zone]
		@owner_email = params[:owner_email]
		@device_name = params[:device_name]
		@error_message = params[:error_message]
		@error_type = params[:error_type]
		@url = params[:url]
		mail(to: @owner_email, subject: "One of your TRASHSORT devices experienced an error")
	end
end
