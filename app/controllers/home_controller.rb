class HomeController < ApplicationController

    def show_home
    render({ :template => "/pages/home.html.erb" })
    #render({ :template => "/layouts/application.html.erb" })
  end

  
end
