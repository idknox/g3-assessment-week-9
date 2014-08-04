feature "ToDos" do
  scenario "A user can sign in a create a ToDo" do

    visit "/"
    click_link "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Sign In"

    expect(page).to have_content "Welcome, hunta"

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

    expect(page).to have_content "ToDo added"

    within ".todos" do
      expect(page).to have_content "Get a haircut"
    end
  end
  scenario "User can edit and complete a ToDo" do
    visit "/"
    click_link "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Sign In"

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

    click_link "Edit"

    fill_in "body", :with => "Get a haircut tomorrow"
    click_button "Update ToDo"

    expect(page).to have_content "Get a haircut tomorrow"
    expect(page).to have_content "ToDo updated"

    click_button "Complete"
    expect(page).to have_content "ToDo completed"
    expect(page).to_not have_content "Get a haircut tomorrow"
  end
end
