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
  	  source_bucket="trashsort_datastore"
  	  require "google/cloud/storage"
  	  storage = Google::Cloud::Storage.new project_id: 'trashsort-258504', keyfile: '/home/henry/Documents/appengine_key.json'
	  bucket  = storage.bucket source_bucket
	  files = bucket.files prefix: "Unlabeled"
	 files.all(request_limit: 1) do |file|
  	  	@file=file.public_url
  	  end
  	  render inline: @file

  end

  def Classify_Post
  		source_bucket="trashsort_datastore"
		@img_src = params[:img_src] #the url of the public image file
		@class = params[:class]#the category of the image
		require "google/cloud/storage"
	
		#derive file name from url
		prefix = "https://storage.googleapis.com/" + source_bucket +"/"
		file_name = @img_src.delete_prefix(prefix)
		
		# authenticate to GCP
		storage = Google::Cloud::Storage.new project_id: 'trashsort-258504', keyfile: '/home/henry/Documents/appengine_key.json'
		bucket  = storage.bucket source_bucket
		file = bucket.file file_name
		file.copy @class+'/'+@class+'.'+file_name.delete_prefix("Unlabeled/")
		file.delete
		render inline: file.name
  end

 
end
