require "application_system_test_case"

class AppraisalsTest < ApplicationSystemTestCase
  setup do
    @appraisal = appraisals(:one)
  end

  test "visiting the index" do
    visit appraisals_url
    assert_selector "h1", text: "Appraisals"
  end

  test "creating a Appraisal" do
    visit appraisals_url
    click_on "New Appraisal"

    fill_in "Book", with: @appraisal.book_id
    fill_in "Review", with: @appraisal.review
    fill_in "Score", with: @appraisal.score
    fill_in "User", with: @appraisal.user_id
    click_on "Create Appraisal"

    assert_text "Appraisal was successfully created"
    click_on "Back"
  end

  test "updating a Appraisal" do
    visit appraisals_url
    click_on "Edit", match: :first

    fill_in "Book", with: @appraisal.book_id
    fill_in "Review", with: @appraisal.review
    fill_in "Score", with: @appraisal.score
    fill_in "User", with: @appraisal.user_id
    click_on "Update Appraisal"

    assert_text "Appraisal was successfully updated"
    click_on "Back"
  end

  test "destroying a Appraisal" do
    visit appraisals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appraisal was successfully destroyed"
  end
end
