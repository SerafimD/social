class PeopleController < ApplicationController
  before_action :find_current_person, only: [:show, :edit, :update] 


  def index
    @people = Person.all
  end

  def show
    
  end

  def edit
    if @person == nil
      redirect_to url_for(:controller => :people, :action => :new)
      return
    end 
  end

  def update
    if @person.update(person_params)
      redirect_to url_for(:controller => :people, :action => :show, :id => @person.id)
    else
      render :edit
    end
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
    d
  end


  private


  def person_params
    params.require(:person).permit(:surename, :date_of_birth)
  end

  def find_current_person
     @person = Person.where(id: params[:id]).take 
  end


end
