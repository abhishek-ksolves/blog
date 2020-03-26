require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "request list of all article" do
    article = Article.create(title:'qwertyfu', text:'asdfg')
    get path
    expect(response).to be_successful
  end
end
require "rails_helper"
