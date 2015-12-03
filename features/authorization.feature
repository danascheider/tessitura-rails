Feature: Authorization

  Background:
    Given I have an active account
    And there is one other user
    And I am logged in

  Scenario: Trying to visit another user's dashboard
    When I visit the other user's dashboard
    Then I should be redirected to my dashboard

  Scenario: Trying to visit another user's tasks page
    When I visit the other user's tasks page
    Then I should be redirected to my dashboard