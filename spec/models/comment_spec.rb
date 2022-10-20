require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.create(name: 'rich', photo: '_url_', bio: 'teacher', posts_counter: 0)

    post = Post.create(title: 'nigeria', text: 'this is nigeria', likes_counter: 0, comments_counter: 0,
                       user_id: user.id)

    Comment.new(text: 'hi rich', user_id: user.id, post_id: post.id)
  end

  before { subject.save }

  it 'User id is present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'Should be valid' do
    expect(subject).to be_valid
  end
end
