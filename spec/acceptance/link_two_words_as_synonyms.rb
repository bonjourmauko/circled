require 'spec_helper'

feature "Link two words as synonyms" do
  # Customer: I.
  # Problem:  Need to see what happens when we link words as synonyms.
  # Solution: Create a graph of linked words.

  # 1Y: Why do I deed to see what happens when we link words as synonyms?
  #     Because I'm curious to see how it looks.
  # 2Y: Why?
  #     Because I guess that, in the end, all words are related to each other.
  # 3Y: Why?
  #     Because word definitions are cross-referential.

  scenario "Create a word", create_a_word: true do
    # Given there is no "word" with the "name" "Good"
    Word.all.each { |w| w.destroy }
    Word.find(name: "Good").should be_nil

    # And I am on the "words" page
    visit words_path

    # When I follow "Add word"
    click_link "Add word"

    # And I fill in "Name" with "Good"
    fill_in "Name", with: "Good"

    # And I press "Add"
    click_button "Save"

    # Then I should be on the "words" page
    page.current_path.should eq words_path

    # And see the "word" with the "name" "Good"
    page.should have_content "Good"
  end

  scenario "Delete a word", delete_a_word: true, js: true do
    # Given there is a "word" with the "name" "Evil"
    Word.all.each { |w| w.destroy }
    Word.create(name: "Evil")

    # And I am on the "words" page
    visit words_path

    # And see the "word" with the "name" "Evil"
    page.should have_content "Evil"

    # When I follow "Delete Evil"
    click_link "Delete Evil"

    # Then I should be on the "words" page
    page.current_path.should eq words_path

    # And not see the "word" with the "name" "Evil"
    visit words_path # yeah I know! :/
    page.should_not have_content "Evil"
  end

  scenario "Add synonyms to words", add_syn: true do
    # Given there is a "word" with the "name" "Good"
    Word.all.each { |w| w.destroy }
    Word.create(name: "Good")

    # And I am on the "words" page
    visit words_path

    # And see the "word" with the "name" "Good"
    page.should have_content "Good"

    # When I follow "Delete Good"
    click_link "Add synonyms to Good"

    # And I fill in "Name" with "Good"
    fill_in "Synonym", with: "Goodness"

    # And I press "Add"
    click_button "Save"

    # Then I should be on the "words" page
    page.current_path.should eq words_path

    # And see the "word" with the "name" "Good"
    page.should have_content "Good"

    # And see the "word" with the "name" "Goodness"
    page.should have_content "Goodness"
  end
end
