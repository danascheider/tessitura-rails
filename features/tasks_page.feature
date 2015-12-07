Feature: Task page
  
  Background:
    Given I have an active account
    And I am logged in
    And I have 1 task in each status category
    When I visit my tasks page

  Scenario: Task page elements
    Then I should see 1 task in the '#backlog_tasks' column
    And I should see 1 task in the '#in_progress_tasks' column
    And I should see 1 task in the '#blocking_tasks' column

  Scenario: Add a task using the quick-add form
    When I create a task called 'Foobar' using the quick-add form in the 'Blocking' column
    Then there should be 5 tasks
    And the status of the new task should be 'Blocking'
    And I should still be on my tasks page
    And I should see 2 tasks in the '#blocking_tasks' column

  Scenario: Delete task from list
    When I click the 'Delete' icon for my 'In Progress' task
    Then there should be 3 tasks
    And I should not see any tasks in the 'In Progress' column