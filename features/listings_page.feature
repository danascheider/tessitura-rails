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

  Scenario: Authorized user views targeted listings
    Given I am a logged-in user with the following attributes:
      | birthdate  |
      | 1987-02-15 |
    And there are listings with the following attributes:
      | minimum_age | maximum_age |
      | 18          | 25          |
      |             | 36          |
    When I visit the listings page
    Then I should only see 1 listing