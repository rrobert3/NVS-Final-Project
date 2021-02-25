class AboutController < ApplicationController

  def show_about
    render({ :template => "/pages/about.html.erb" })
  end



end