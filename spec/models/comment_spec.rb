require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validates test' do  # (almost) plain English
    it 'ensures commenter presence' do
      comment = Comment.new(body:'asdfg').save
      expect(comment).to eq(false)  # test code
    end
    it 'ensures body presence' do
      comment = Comment.new(commenter: 'qwer').save
      expect(comment).to eq(false)  # test code
    end
    it 'ensures commenter presence' do
      user = User.create(email: 'a@gmail.com', password: '123456')
      article = Article.create(title:'qwertyfu', text:'asdfg', user_id: user.id)
      comment = Comment.new(body:'asdfg', article_id: article.id, user_id: user.id).save
      expect(comment).to eq(false)  # test code
    end
    it 'ensures body presence' do
      user = User.create(email: 'a@gmail.com', password: '123456')
      article = Article.create(title:'qwertyfu', text:'asdfg', user_id: user.id)
      comment = Comment.new(commenter:'qwertyfu', article_id: article.id, user_id: user.id).save
      expect(comment).to eq(false)  # test code
    end
    it 'should save sucessfully' do
      user = User.create(email: 'a@gmail.com', password: '123456')
      article = Article.create(title:'qwertyfu', text:'asdfg', user_id: user.id)
      comment = Comment.new(commenter:'qwertyfu', body:'asdfg', article_id: article.id, user_id: user.id).save
      #expect(article).to be_valid
      expect(comment).to eq(true)  # test code
    end
    it 'should save sucessfully' do
      user = User.create(email: 'a@gmail.com', password: '123456')
      article = Article.create(title:'qwertyfu', text:'asdfg', user_id: user.id)
      comment = Comment.create(commenter:'qwertyfu', body:'asdfg', article_id: article.id, user_id: user.id)
      expect(article).to be_valid
  # test code
    end
  end
end
