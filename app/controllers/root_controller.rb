class RootController < ApplicationController
	def top
		@post = Post.new
	end
end

