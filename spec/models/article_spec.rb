require 'rails_helper'

RSpec.describe 'Article' ,type: :model do           #
  context 'validates test' do  # (almost) plain English
    it 'ensures title presence' do
      article = Article.new(text:'asdfg').save
      expect(article).to eq(false)  # test code
    end
    it 'ensures text presence' do
      article = Article.new(title: 'qwer').save
      expect(article).to eq(false)  # test code
    end
    it 'should not save sucessfully because user id does\'t exist' do
      article = Article.new(title:'qwertyfu', text:'asdfg').save
      expect(article).to eq(false)  # test code
    end
    it 'save sucessfully because user id passed' do
      user = User.create(email: 'a@gmail.com', password: '123456')
      article = Article.new(title:'qwertyfu', text:'asdfg', user_id: user.id).save
      expect(article).to eq(true)  # test code
    end
    it 'ensures lenght of title is less than 5 no save' do
      article = Article.new(title:'q', text:'asdfg').save
      expect(article).to eq(false)  # test code
    end
    it 'ensures integer in title should not saved' do
      article = Article.new(title: 1, text:'asdfg').save
      expect(article).to eq(false)  # test code
    end
    it 'Can be created' do
      user = User.create(email: 'a@gmail.com', password: '123456')
      article = Article.create(title: 'hello there', text:'asdfg', user_id: user.id)
      #expect(article).to eq(true)
      expect(article).to be_valid  # test code
    end
    it 'passing invalid email user creation article can not be created' do
      user = User.create(email: 'agmail.com', password: '123456')
      article = Article.new(title: 'hello there', text:'asdfg', user_id: user.id)
      #expect(article).to eq(true)
      expect(article).to be_invalid  # test code
    end
  end
end
