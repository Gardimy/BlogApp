require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  before do
  end

  it 'displays post details and comments' do
    visit post_path(Post.first)

  end
end
