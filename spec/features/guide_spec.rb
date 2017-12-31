require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit guides_path
    end
    
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
    
    it 'has a title of Guide' do
      expect(page).to have_content(/Guide/)
    end
    
    it 'can see guide on index page' do
      published1 = Guide.create(title: "My first guide", content: "Published guide 1", published: true)
      published2 = Guide.create(title: "My first guide", content: "Published guide 2", published: true)
      visit guides_path
      
      expect(page).to have_content(/Published guide 1|Published guide 2/)
    end
    
    it 'has new guide button that go to new page' do
      click_on "New Guide"
      expect(page).to have_content(/New Guide Form/)
    end
  end
  
  describe 'guide creation' do
    before do
      visit new_guide_path
    end
    
    it 'has creation form that can be reached' do
      expect(page.status_code).to eq(200)
    end
    
    it 'new guide can be create from new page form' do
      fill_in 'guide[title]', with: "My first guide"
      fill_in 'guide[content]', with: "first guide content"
      check 'Published'
      
      expect { click_button('Save') }.to change(Guide, :count).by(1)
    end
    
    it 'new guide that not check for Published has false value' do
      fill_in 'guide[title]', with: "My first guide"
      fill_in 'guide[content]', with: "first guide content"
      click_on 'Save'
      
      expect(Guide.last.published).to eq(false)
    end
    
    it 'has a scope so that only published guide can be seen on index page' do
      published = Guide.create(title: "My first guide", content: "Published guide", published: false)
      visit guides_path
      
      expect(page).to_not have_content(/Published guide/)
    end
  end
end