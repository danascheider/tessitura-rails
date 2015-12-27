Feature: User dashboard

  Background:
    Given I am a logged-in user with 3 tasks

  Scenario: Top widgets
    When I visit my dashboard
    Then the 'tasks' widget should say I have 3 incomplete tasks

  Scenario: User has complete tasks
    Given I have 1 complete task
    When I visit my dashboard
    Then the 'tasks' widget should say I have 3 incomplete tasks

  Scenario: Task panel
    Given one of my tasks is blocking
    And I have 1 complete task
    When I visit my dashboard
    Then the '#task-panel' element should display 2 tasks

  Scenario: Fuck-ton of tasks
    Given I have a shitload of incomplete tasks
    When I visit my dashboard
    Then the '#task-panel' element should display 10 tasks

  Scenario: There are deadlines
    Given there are 2 upcoming deadlines
    And there are 3 past deadlines
    When I visit my dashboard
    Then the 'deadlines' widget should say there are 2 upcoming deadlines

  @javascript
  Scenario: Mark task complete from the task panel
    When I click the 'Mark Complete' icon for the first task
    Then the '#task-panel' element should display 2 tasks
    And the 'tasks' widget should say I have 2 incomplete tasks
    And I should have 1 complete task

  @javascript
  Scenario: Delete task from the task panel
    When I click the 'Delete' icon for the first task
    Then the '#task-panel' element should display 2 tasks
    And the 'tasks' widget should say I have 2 incomplete tasks
    And I should have 2 tasks

  @javascript
  Scenario: Add task from the quick-add form
    Given I am on my dashboard
    When I submit the quick-add form in the '#task-panel' element
    Then I should have 4 tasks
    And the '#task-panel' element should display 4 tasks