class TestController < ApplicationController

    def show_test
    render({ :template => "/pages/test.html.erb" })
    #render({ :template => "/layouts/application.html.erb" })
  end

  
end
