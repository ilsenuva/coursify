require 'rails_helper'

RSpec.feature "Admins pueden editar materiales" do 
	before do 
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		material = Material.create(name: "Presentación PPT, Pitágoras", description: "Presentación de la primera clase", file: "www.drive.com/file", course_id: course.id)
		admin = Admin.create(name: "Luisa Pérez", email: "luisa@email.com", password: "qwerty123", password_confirmation: "qwerty123")
		visit "/admins/sign_in"
		fill_in "admin_email", with: "luisa@email.com"
		fill_in "admin_password", with: "qwerty123"
		click_button "Log in"
	end
	scenario "con atributos válidos" do
		click_link "Matemáticas"
		click_link "Presentación PPT, Pitágoras"
		click_link "Editar"
    	fill_in "Name", with: "Presentación PPT"
    	click_button "Guardar"
		expect(page).to have_content "Se ha actualizado el material."
		expect(page).to have_content "Presentación PPT"
	end

	scenario "los atributos nos son válidos" do 
		click_link "Matemáticas"
		click_link "Presentación PPT, Pitágoras"	
		click_link "Editar"
    	fill_in "Name", with: ""
		click_button "Guardar"
		expect(page).to have_content "No se ha actualizado el material."
	end
end
