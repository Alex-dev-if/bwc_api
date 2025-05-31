require "application_system_test_case"

class CopiesTest < ApplicationSystemTestCase
  setup do
    @copy = copies(:one)
  end

  test "visiting the index" do
    visit copies_url
    assert_selector "h1", text: "Copies"
  end

  test "should create copy" do
    visit copies_url
    click_on "New copy"

    click_on "Create Copy"

    assert_text "Copy was successfully created"
    click_on "Back"
  end

  test "should update Copy" do
    visit copy_url(@copy)
    click_on "Edit this copy", match: :first

    click_on "Update Copy"

    assert_text "Copy was successfully updated"
    click_on "Back"
  end

  test "should destroy Copy" do
    visit copy_url(@copy)
    click_on "Destroy this copy", match: :first

    assert_text "Copy was successfully destroyed"
  end
end
