describe "home", type: :feature, js: true do
  it "has title that includes Home" do
    visit('/')
    expect(page.title).to include('Home')
  end
end
