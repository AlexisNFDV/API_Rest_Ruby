require "application_system_test_case"

class ComputersTest < ApplicationSystemTestCase
  setup do
    @computer = computers(:one)
  end

  test "visiting the index" do
    visit computers_url
    assert_selector "h1", text: "Computers"
  end

  test "creating a Computer" do
    visit computers_url
    click_on "New Computer"

    fill_in "Name", with: @computer.name
    fill_in "Processor", with: @computer.processor
    fill_in "Ram", with: @computer.ram
    fill_in "Size", with: @computer.size
    fill_in "Storage", with: @computer.storage
    click_on "Create Computer"

    assert_text "Computer was successfully created"
    click_on "Back"
  end

  test "updating a Computer" do
    visit computers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @computer.name
    fill_in "Processor", with: @computer.processor
    fill_in "Ram", with: @computer.ram
    fill_in "Size", with: @computer.size
    fill_in "Storage", with: @computer.storage
    click_on "Update Computer"

    assert_text "Computer was successfully updated"
    click_on "Back"
  end

  test "destroying a Computer" do
    visit computers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Computer was successfully destroyed"
  end
end
