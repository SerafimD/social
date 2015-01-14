class PeopleController < ApplicationController
before_action :find_current_person, only: [:show, :edit, :update] 
before_filter :authenticate_user!

  def index
    @people = Person.all
  end

  def show
    
  end

  def edit
    render :new unless @person
  end

  def update
    if @person.update(person_params)
      render :show
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
      render :show
    else
      render :new
    end    
  end


  private


  def person_params
    params.require(:person).permit(:surename, :date_of_birth)
  end

  def find_current_person
     @person = Person.where(id: params[:id]).take
  end


end
