feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags', with: 'education'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')

    within 'ul#links' do
      expect(page).to have_content('education')
    end
  end

  scenario 'I can add multiple tags to a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags', with: 'education, ruby'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end
end
