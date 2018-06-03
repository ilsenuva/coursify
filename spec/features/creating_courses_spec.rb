require "rails_helper"

RSpec.feature "Admins can create projects" do 
	before do 
		admin = Admin.create(name: "Luisa Pérez", email: "luisa@email.com", password: "qwerty123", password_confirmation: "qwerty123")
		visit "/admins/sign_in"
		fill_in "admin_email", with: "luisa@email.com"
		fill_in "admin_password", with: "qwerty123"
		click_button "Log in"
	end
	scenario "attributes are valid" do 
		click_link "Nuevo Curso"
		fill_in "Name", with: "Matemáticas"
		fill_in "Description", with: "Es un curso de matemáticas básicas"
		click_button "Guardar"
		expect(page).to have_content "Se ha creado el curso."
	end

	scenario "los atributos no son válidos" do 
		click_link "Nuevo Curso"
		click_button "Guardar"
		expect(page).to have_content "No se ha creado el curso."
	end
end

