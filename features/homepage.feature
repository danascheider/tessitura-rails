Feature: Homepage

  Scenario: Visiting the homepage
    Given I am on the homepage
    Then I should see the top navbar
    And I should see a link to the 'About' view
    And I should see a link to the 'Sign Up' view
    And I should see a link to the 'Contact' view