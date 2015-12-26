Feature: Create listings

  Scenario: Regular user attempts to create a listing
    Given I am a logged-in user
    And there are 2 listings
    When I visit the listing creation page
    Then I should be redirected to the listings page

  Scenario: Admin creates a listing with valid attributes
    Given I am a logged-in admin
    And there are 2 listings
    When I visit the listing creation page
    And I submit the listing creation form with valid attributes
    Then there should be 3 listings
    And I should see a message that the listing was created successfully

  Scenario: Admin creates a listing with a deadline
    Given I am a logged-in admin
    And there are no listings
    When I visit the listing creation page
    And I submit the creation form with valid deadline information
    Then there should be 1 listing
    And the listing should have 1 deadline