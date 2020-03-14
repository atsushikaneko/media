require 'rails_helper'

describe 'About' do
  specify '画面の表示' do
    visit '/about'
    expect(page).to have_css('title', text: 'アバウト')
    expect(page).to have_css('a', text: 'マイブログ')
  end
end

describe 'Help' do
  specify '画面の表示' do
    visit '/help'
    expect(page).to have_css('h1', text: 'ヘルプ')
  end
end
