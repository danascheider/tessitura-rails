@javascript
Feature: User login
  
  Scenario: Show login form
    Given I am on the homepage
    When I click the 'Sign In' link
    Then I should see the login form

  Scenario: Hide login form
    Given I am on the homepage
    Given I have clicked the 'Sign In' link
    When I double-click the '#shade' element
    Then I should not see the login form

  Scenario: Valid login
    Given I have an active account
    And I am on the homepage
    And I have clicked the 'Sign In' link
    When I submit the login form with my credentials
    Then I should be rerouted to my dashboard