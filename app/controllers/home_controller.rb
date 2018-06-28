class HomeController < ApplicationController
    def index
     @lastposts = Post.last(5)
     @lastnormatives = Normative.last(5)     
    end
end
