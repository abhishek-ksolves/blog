require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  context "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response.status).to eq(200)
    end
  end
  context "GET #show" do
    it "returns a successful response" do
      user = User.create(email: 'a@gmail.com', password: '123456')
      article = Article.create(title:'qwertyfu', text:'asdfg', user_id: user.id)
      get :show, params: { article_id: article.to_param}
      expect(response.status).to eq(200)
    end
  end
  context "GET #showsss" do
    it "responds successfully" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
