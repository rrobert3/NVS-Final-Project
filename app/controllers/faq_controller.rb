class FaqController < ApplicationController

    def show_faq
    render({ :template => "/pages/faq.html.erb" })
  
  end
end