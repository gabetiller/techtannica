require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  describe "#downgrade" do
    context "current user role is premium" do
      let(:user) do
        User.create!(
          role: :premium,
          email: 'email@email.com',
          password: 'password'
        )
      end

      before do
        sign_in user
      end

      it "sets the role to standard" do
        post :downgrade

        user.reload

        expect(user.role).to eq :standard
      end

      it "sets their wikis to public" do
        post :downgrade

        expect(
          user.wikis.map&(:private).uniq.first
        ).to eq false
      end

      it "redirects to root"
    end

    context "current user role is standard" do
      it "redirects to wikis_path"
    end
  end
end
