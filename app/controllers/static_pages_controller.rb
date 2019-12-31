class StaticPagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def Home
  end

  def About
  end

  def Demo
  end
	
  def Contact 
  end

  def Classify
  end

  def Classify_Get
  	  source_bucket="trash-dataset"
  	  require "google/cloud/storage"
  	  storage = Google::Cloud::Storage.new project_id: 'trashsort-263700', keyfile:  Rails.root.to_s + '/GCP_storage_key.json'
	    bucket  = storage.bucket source_bucket
	    files = bucket.files prefix: "Unlabeled"
	    files.all(request_limit: 1) do |file|
  	  	@file=file.public_url
  	  end
  	  if @file.nil?
  	  	@file="no_images"
  	  end
  	  render inline: @file
  end

  def Classify_Post
  	source_bucket="trash-dataset"
		@src = params[:src] #the url of the public image file
		@category = params[:category]#the category of the image
		require "google/cloud/storage"
	
		#derive file name from url
		prefix = "https://storage.googleapis.com/" + source_bucket +"/"
		file_name = @src.delete_prefix(prefix)
		
		# authenticate to GCP
		storage = Google::Cloud::Storage.new project_id: 'trashsort-263700', keyfile: Rails.root.to_s + '/GCP_storage_key.json'
		bucket  = storage.bucket source_bucket
		file = bucket.file file_name
		file.copy @category+'/'+@category+'.'+file_name.delete_prefix("Unlabeled/")
		file.delete
		render inline: file.name
  end

 
end
