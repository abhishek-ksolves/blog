require 'rails_helper'

RSpec.describe 'Article' ,type: :model do           #
  context 'validates test' do  # (almost) plain English
    it 'title' do
      article = Article.new(user_id: 'qwer').save
      expect(article).to eq(false)  # test code
    end
  end
end
