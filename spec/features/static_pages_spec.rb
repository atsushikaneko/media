require 'rails_helper'

RSpec.describe "Abotu" do

  describe 'About' do
    it '全部できること' do
      expect(1 + 2).to eq 3
      expect(10 - 1).to eq 9
      expect(4 * 8).to eq 32
      expect(40 / 5).to eq 8
    end
    it 'wfewswrerv' do
      visit '/about'
      expect(page).to have_css('title', text: 'アバウト')
    end
    it 'wfewswrerv' do
      visit '/about'
      expect(page).to have_css('title', text: 'アバウト')
    end
  end

  describe 'Help' do
    it '画面の表示' do
      visit '/help'
      expect(page).to have_css('h1', text: 'ヘルプ')
    end
  end

end


#テストのテスト
Rspec.discribe User do
 before do
   @params = {name:"asdfdcvf",email:"atsuhi.kaneacdscko@vitalize.co.jp",password:"sadfbds",blogtitle:"afbgfds"}
  end
  context "usertest" do
     it "ううううん" do
 　    expect(User.new(@params)).to eq "aa"
     end
  end
end
