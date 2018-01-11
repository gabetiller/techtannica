require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", user: user) }
  let(:user) { User.create!(email: "user@wiki.com", password: "helloworld") }

   describe "attributes" do
       it "has a title, body, and user attribute" do
       expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", user: user)
     end
   end
end
