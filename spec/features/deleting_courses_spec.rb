require "rails_helper"

RSpec.feature "Admins pueden eliminar cursos" do 
	scenario "con éxito" do 
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		admin = Admin.create(name: "Luisa Pérez", email: "luisa@email.com", password: "qwerty123", password_confirmation: "qwerty123")
		visit "/admins/sign_in"
		fill_in "admin_email", with: "luisa@email.com"
		fill_in "admin_password", with: "qwerty123"
		click_button "Log in"
		click_link "Matemáticas"
		click_link "Eliminar"
		expect(page).to have_content "El curso se ha eliminado."
        expect(page.current_url).to eq courses_url
        expect(page).to have_no_content "Matemáticas"
	end
end	

