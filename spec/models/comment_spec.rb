require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    sleep 0.1
    @comment = FactoryBot.build(:comment, item_id: item.id, user_id: user.id)
  end

  context 'ユーザーがコメントできる時' do
    it 'user_id,item_id,commentがあればコメントできる' do
      expect(@comment).to be_valid
    end
  end

  context 'ユーザーがコメントできない時' do
    it 'user_idがないとコメントできない' do
      @comment.user_id = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("User must exist")
    end
    it 'item_idがないとコメントできない' do
      @comment.item_id = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Item must exist")
    end
  end
end
