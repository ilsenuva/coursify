require 'rails_helper'
RSpec.feature "Usuarios pueden ver cursos" do 
	scenario "ven detalles del curso" do 
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		user = User.create(name: "Cecilia López", email: "cecilia@email.com", password: "qwerty123", password_confirmation: "qwerty123")
		visit "/"
		click_link "Iniciar Sesión"
		fill_in "user_email", with: "cecilia@email.com"
		fill_in "user_password", with: "qwerty123"
		click_button "Log in"
		click_link "Matemáticas"
		expect(page.current_url).to eq course_url(course)
		expect(page).to have_content "Matemáticas"
	end
end


