class MaterialsController < ApplicationController
	before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
	before_action :authenticate_user_or_admin, only: [:show]
	before_action :set_course
	before_action :set_material, only: [:show, :edit, :update, :destroy]
	before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

	def index
	end

	def new
		@material = @course.materials.build
	end

	def create
		@material = @course.materials.build(material_params)
		if @material.save
			flash[:notice] = "Se ha guardado el archivo."
			redirect_to @course
		else
			flash[:error] = "No se ha guardado el material."

			render action: "new"
		end
	end

	def show
		@material = @course.materials.find(params[:id])
	end

	def edit
		@material = @course.materials.find(params[:id])
	end

	def update
		if @material.update(material_params)
			flash[:notice] = "Se ha actualizado el material."
			redirect_to [@course, @material]
		else
			flash[:error] = "No se ha actualizado el material."

			render action: "edit"
		end
	end

	def destroy
		@material.destroy
		flash[:notice] = "El material se ha eliminado."
		redirect_to @course
	end

	private 
		def authenticate_user_or_admin
			if !admin_signed_in? and !user_signed_in?
				flash[:notice] = "Necesitar iniciar sesión para ver esta información."
				redirect_to root_url
			end
		end
		def set_course
			@course = Course.find(params[:course_id])
		end
		def set_material
			@material = @course.materials.find(params[:id])
		end
		def material_params
			params.require(:material).permit(:name, :description, :file)
		end

		def set_s3_direct_post
    		@s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  		end
end
