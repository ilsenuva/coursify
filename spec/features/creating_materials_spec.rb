require "rails_helper"

RSpec.feature "Admins pueden crear materiales dentro de cursos" do 
	before do 
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas") 
		admin = Admin.create(name: "Luisa Pérez", email: "luisa@email.com", password: "qwerty123", password_confirmation: "qwerty123")
		visit "/admins/sign_in"
		fill_in "admin_email", with: "luisa@email.com"
		fill_in "admin_password", with: "qwerty123"
		click_button "Log in"
	end
	scenario "con atributos válidos" do
		click_link "Matemáticas"
		click_link "Añadir material"
		fill_in "Name", with: "Presentación PPT, Pitágoras"
		fill_in "Description", with: "Presentación de la primera clase"
		click_button "Guardar"
		expect(page).to have_content "Se ha guardado el archivo."
	end
	scenario "los atributos nos son válidos" do 
		click_link "Matemáticas"
		click_link "Añadir material"	
    	fill_in "Name", with: ""
		click_button "Guardar"
		expect(page).to have_content "No se ha guardado el material."
	end
end

