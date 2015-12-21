Feature: Listings page
  
  Scenario: Unauthorized user attempts to view listings
    Given I am not logged in
    When I visit the listings page
    Then I should be redirected to the

  Scenario: Authorized user views listings
    Given I am a logged-in user
    And there are 3 listings
    When I visit the listings page
    Then I should see all 3 listings