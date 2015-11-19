@javascript
Feature: User login
  
  Background: 
    Given I am on the homepage

  Scenario: Show login form
    When I click the 'Sign In' link
    Then I should see the login form

  Scenario: Hide login form
    Given I have clicked the 'Sign In' link
    When I double-click the '#shade' element
    Then I should not see the login form