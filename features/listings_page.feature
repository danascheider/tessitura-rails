Feature: Listings page
  
  Scenario: Unauthorized user attempts to view listings
    Given I am not logged in
    When I visit the listings page
    Then I should be redirected to the login page

  Scenario: Authorized user views listings
    Given I am a logged-in user
    And there are 3 listings
    When I visit the listings page
    Then I should see all 3 listings

  Scenario: Regular user attempts to create a listing
    Given I am a logged-in user
    And there are 2 listings
    When I visit the listing creation page
    Then I should be redirected to the listings page