require 'rails_helper'

RSpec.describe 'User show', type: :system do
  before :each do
    @user = User.create(name: 'Tim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Coach')
    @post = Post.create(user: @user, title: 'Test', text: 'This is a test post')
    Comment.create(user: @user, post: @post, text: 'Test Comment')
    visit user_path(@user.id)
  end

  it 'shows number of posts' do
    expect(page).to have_content('Number of posts: 1')
  end

  it 'shows user\'s bio' do
    expect(page).to have_content(@user.bio)
  end
  it 'shows profile picture of every user' do
    expect(page).to have_content(@user.photo)
  end
end
