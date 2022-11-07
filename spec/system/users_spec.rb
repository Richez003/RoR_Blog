require 'rails_helper'

RSpec.describe 'User show', type: :system do
  before :each do
    @user = User.create(name: 'Tim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Coach')
    @post = Post.create(user: @user, title: 'Test', text: 'This is a test post')
    visit user_path(@user = 2)
  end

  # it 'has user profghgbile picture' do
    # expect(page).to have_content('image_tag('user.jpg', class: "userPix")')
  # end

  # it 'shows number of posts' do
  #   expect(page).to have_content('Number of posts: 0')
  # end
  # it 'shows number of posts' do
  #   expect(page).to have_content('Number of posts: 1')
  # end


  it 'shows user\'s bio' do
    expect(page).to have_content(@user.bio)
  end
  # it 'shows profile picture of every user' do
  #   expect(page).to have_content(@user.photo)
  # end
end
