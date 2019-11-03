class DevicesController < ApplicationController
 skip_before_action :verify_authenticity_token
  def Flag
		@owner_email = params[:owner_email]
		@device_name = params[:device_name]
		@error_message = params[:error_message]
    @error_type = params[:error_type]
    @url = request.original_url
		AlertMailer.with(owner_email: @owner_email, 
                     device_name: @device_name, 
                     error_type: @error_type,
                     error_message: @error_message,
                     url: @url).alert.deliver_now
  end

  def RequestPredict	
  end

  def Register
  end
end
