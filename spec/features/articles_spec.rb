require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  context 'create new article' do
    before(:each) do
      visit '/articles/new'
      within("form") do
      end
    end

    scenario "should be successful" do
      within("form") do
        fill_in 'Title', with: 'john@gmail.com'
        fill_in 'Text', with: '123456'
      end
      click_button 'Create Article'
      expect(page).to have_content 'We have total 3 articles available.'
    end

    scenario "should fail" do
      click_button 'Create Article'
      expect(page).to have_content 'Text can\'t be blank'
    end
    scenario "text can be blank" do
      within("form") do
        fill_in 'Title', with: 'john@gmail.com'
      end
      click_button 'Create Article'
      expect(page).to have_content 'Text can\'t be blank'
    end
  end

  context 'update article' do
    scenario "should be successful" do
      article = Article.create(title:'qwertyfu', text:'asdfg')
      visit edit_article_path(article)
      within("form") do
        fill_in 'Title', with: 'john@gmail.com'
        fill_in 'Text', with: '123456'
      end
      click_button 'Update Article'
      expect(page).to have_content 'You have added 0 comments on this Article.'
    end
  end
end
