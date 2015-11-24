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

  Scenario: Invalid account on utility page
    Given I am on the login page
    When I try to log in with invalid credentials
    Then I should be on the login page
    And I should see a message that I could not be logged in

  Scenario: Invalid account on homepage
    And I am on the homepage
    And I have clicked the 'Sign In' link
    When I try to log in with invalid credentials
    Then I should be on the login page
    And I should see a message that I could not be logged in

  Scenario: Unauthorized user goes to dashboard
    Given there is 1 user
    When I try to log in with invalid credentials
    And I navigate to the dashboard
    Then I should be redirected to a login page

  Scenario: Logging in from the utility page
    Given I have an active account
    And I am on the login page
    When I submit the login form with my credentials
    Then I should be rerouted to my dashboard