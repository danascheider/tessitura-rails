Feature: Favorite listings
  
  Scenario: Add a listing to favorites
    Given I am a logged-in user
    And there are 2 listings
    And I have no favorites
    And I am viewing the 1st listing
    When I click 'Add to Favorites'
    Then my favorites should include the 1st listing