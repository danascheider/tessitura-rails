Feature: Create task from listing

  @javascript
  Scenario: Single deadline
    Given I am a logged-in user
    And there is 1 listing with a deadline
    And I have no tasks
    And I am viewing the listing
    When I click 'Create Task'
    Then I should be on the task creation form
    And the task's deadline should be the same as the listing's