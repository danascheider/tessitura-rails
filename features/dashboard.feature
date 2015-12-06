Feature: User dashboard

  Background:
    Given I am a logged-in user with 3 tasks
    When I visit my dashboard

  Scenario: Top widgets
    Then the 'tasks' widget should say I have 3 incomplete tasks

  Scenario: User has complete tasks
    Given I have 1 complete task
    Then the 'tasks' widget should say I have 3 incomplete tasks
