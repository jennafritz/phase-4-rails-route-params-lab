class StudentsController < ApplicationController

  def index
    students = Student.all
    search_term = params[:name]
    if params[:name] 
      name_match = Student.where("first_name LIKE ?", search_term).or(Student.where("last_name LIKE ?", search_term))
      render json: name_match
    else
      render json: students
    end
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
