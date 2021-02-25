class Userbets < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index] })

  def index
    @photos = Photo.joins(:poster).all.where({ :users => { :private => false } }).order({ :created_at => :desc })

    render({ :template => "photos/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @photo = Photo.where({:id => the_id }).at(0)

    render({ :template => "photos/show.html.erb" })
  end

  def create
    @photo = Photo.new
    @photo.caption = params.fetch("query_caption")
    @photo.image = params.fetch("query_image")
    @photo.owner_id = @current_user.id

    if @photo.valid?
      @photo.save
      redirect_to("/photos", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos", { :notice => "Photo failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @photo = Photo.where({ :id => the_id }).at(0)

    @photo.caption = params.fetch("query_caption")
    @photo.image = params.fetch("query_image")

    if @photo.valid?
      @photo.save
      redirect_to("/photos/#{@photo.id}", { :notice => "Photo updated successfully."} )
    else
      redirect_to("/photos/#{@photo.id}", { :alert => "Photo failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @photo = Photo.where({ :id => the_id }).at(0)

    @photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end
end
