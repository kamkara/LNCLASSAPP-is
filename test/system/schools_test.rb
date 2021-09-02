require "application_system_test_case"

class SchoolsTest < ApplicationSystemTestCase
  setup do
    @school = schools(:one)
  end

  test "visiting the index" do
    visit schools_url
    assert_selector "h1", text: "Schools"
  end

  test "creating a School" do
    visit schools_url
    click_on "New School"

    fill_in "School", with: @school.school_id
    fill_in "Slug", with: @school.slug
    fill_in "Title", with: @school.title
    fill_in "User", with: @school.user_id
    click_on "Create School"

    assert_text "School was successfully created"
    click_on "Back"
  end

  test "updating a School" do
    visit schools_url
    click_on "Edit", match: :first

    fill_in "School", with: @school.school_id
    fill_in "Slug", with: @school.slug
    fill_in "Title", with: @school.title
    fill_in "User", with: @school.user_id
    click_on "Update School"

    assert_text "School was successfully updated"
    click_on "Back"
  end

  test "destroying a School" do
    visit schools_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "School was successfully destroyed"
  end
end
