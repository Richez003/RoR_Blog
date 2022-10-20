require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.create(name: 'rich', photo: '_url_', bio: 'teacher', posts_counter: 0)
    Post.new(title: 'nigeria', text: 'this is nigeria', likes_counter: 0, comments_counter: 0, user_id: user.id)
  end
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Should be valid' do
    expect(subject).to be_valid
  end

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be a greter than or equal to 0' do
    expect(subject.likes_counter).to be >= 0
  end

  it 'comments_counter should be a greter than or equal to 0' do
    expect(subject.comments_counter).to be >= 0
  end
end
