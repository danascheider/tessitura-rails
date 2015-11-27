Feature: Task page
  
  Background:
    Given I have an active account
    And I am logged in

  Scenario: Task page elements
    Given I have 1 task in each status category
    When I visit my tasks page
    Then I should see 1 task in the '#backlog_tasks' column
    And I should see 1 task in the '#in_progress_tasks' column
    And I should see 1 task in the '#blocking_tasks' column