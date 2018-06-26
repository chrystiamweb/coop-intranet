require "application_system_test_case"

class NormativesTest < ApplicationSystemTestCase
  setup do
    @normative = normatives(:one)
  end

  test "visiting the index" do
    visit normatives_url
    assert_selector "h1", text: "Normatives"
  end

  test "creating a Normative" do
    visit normatives_url
    click_on "New Normative"

    fill_in "Description", with: @normative.description
    fill_in "Title", with: @normative.title
    click_on "Create Normative"

    assert_text "Normative was successfully created"
    click_on "Back"
  end

  test "updating a Normative" do
    visit normatives_url
    click_on "Edit", match: :first

    fill_in "Description", with: @normative.description
    fill_in "Title", with: @normative.title
    click_on "Update Normative"

    assert_text "Normative was successfully updated"
    click_on "Back"
  end

  test "destroying a Normative" do
    visit normatives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Normative was successfully destroyed"
  end
end
