class PagesController < ApplicationController
	def index
	  @url = Url.new
	end

	def show
		@url = Url.find(params[:id])
	end

	def create
		@url = Url.new(url_param)
		
		unless (@url.url.start_with?('http://',"https://"))
			
			@url.url = "http://" + @url.url
		end
		length = 40
		@url.long = SecureRandom.hex(length)
		if @url.save
			redirect_to @url
		else
			render 'new'
		end
	
	end

	def redirect
		@url = Url.where(long: params[:id]).first
		if (@url.nil?)
			render 'notfound'
		else
			redirect_to @url.url
		end
	end

	def all
		@url =Url.all
	end

	def destroy
		@url = Url.find(params[:id])
		@url.destroy
		redirect_to all_path
	end

	def notfound
	end

	private
		def url_param
			params.require(:url).permit(:url)
		end
end