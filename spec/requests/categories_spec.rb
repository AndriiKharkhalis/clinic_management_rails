require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:admin) { AdminUser.create!(email: "admin@test.com", password: "password") }

  it "creates a new category via admin" do
    sign_in admin 
    post admin_categories_path, params: { category: { name: "Neurology" } }
    
    expect(response).to redirect_to(admin_category_path(Category.last))
    expect(Category.last.name).to eq("Neurology")
  end
end
