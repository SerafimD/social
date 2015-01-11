class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    @person.user_id = current_user.id
    if @person.save
      redirect_to url_for(:controller => :people, :action => :show, :id => @person.id)
    else
      render :new
    end
  end


  private


  def person_params
    params.require(:person).permit(:surename, :date_of_birth)
  end
end
