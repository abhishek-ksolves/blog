require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  context 'create new comment' do
    scenario "should be successful" do
      article = Article.create(title:'qwertyfu', text:'asdfg')
      id = article.id
      visit "/articles/"+id.to_s
      within("form") do
        fill_in 'Commenter', with: 'john@gmail.com'
        fill_in 'Body', with: '123456'
      end
      click_button 'Create Comment'
      expect(page).to have_content 'You have signed up successfully.'
    end
  end
end
