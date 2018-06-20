class HomeController < ApplicationController
    def index
     @lastposts = Post.last(5)
    end
end
