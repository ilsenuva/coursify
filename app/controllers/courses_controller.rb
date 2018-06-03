class CoursesController < ApplicationController
	before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
	before_action :authenticate_user_or_admin, only: [:show]
	before_action :set_course, only: [:show, :edit, :update, :destroy]
	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			flash[:notice] = "Se ha creado el curso."
			redirect_to @course
		else
			flash[:error] = "No se ha creado el curso."
			render action: "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @course.update(course_params)
			flash[:notice] = "Se ha actualizado el curso."
			redirect_to @course
		else
			flash[:error] = "No se ha actualizado el curso."
			render action: "edit"
		end
	end

	def destroy
		@course.destroy
		flash[:notice] = "El curso se ha eliminado."
		redirect_to courses_path
	end

	private
		def authenticate_user_or_admin
			if !admin_signed_in? and !user_signed_in?
				flash[:notice] = "Necesitar iniciar sesión para ver esta información."
				redirect_to root_url
			end
		end
		def set_course
			@course = Course.find(params[:id])
		end
		def course_params
			params.require(:course).permit(:name, :description)
		end
end
