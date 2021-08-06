require "application_system_test_case"

class BookCollectionsTest < ApplicationSystemTestCase
  setup do
    @book_collection = book_collections(:one)
  end

  test "visiting the index" do
    visit book_collections_url
    assert_selector "h1", text: "Book Collections"
  end

  test "creating a Book collection" do
    visit book_collections_url
    click_on "New Book Collection"

    fill_in "Book", with: @book_collection.book_id
    check "Owned" if @book_collection.owned
    fill_in "State", with: @book_collection.state
    fill_in "User", with: @book_collection.user_id
    click_on "Create Book collection"

    assert_text "Book collection was successfully created"
    click_on "Back"
  end

  test "updating a Book collection" do
    visit book_collections_url
    click_on "Edit", match: :first

    fill_in "Book", with: @book_collection.book_id
    check "Owned" if @book_collection.owned
    fill_in "State", with: @book_collection.state
    fill_in "User", with: @book_collection.user_id
    click_on "Update Book collection"

    assert_text "Book collection was successfully updated"
    click_on "Back"
  end

  test "destroying a Book collection" do
    visit book_collections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book collection was successfully destroyed"
  end
end
