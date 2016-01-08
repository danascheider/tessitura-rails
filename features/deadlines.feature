Feature: Deadlines
  
  Deadlines can belong to either tasks or listings. Each task can have one 
  deadline, while each listing can have an arbitrary number. One deadline can
  belong to both a task and a listing. Deadlines should not exist without
  either a task or a listing, but should not be deleted when an owner is
  if another owner is present.

  Scenario Outline: Deadline owned only by a listing or task
    Given one <parent>
    And the <parent> has a deadline
    When the <parent> is deleted
    Then the deadline should be deleted too

      Examples:
        | parent  |
        | listing |
        | task    |

  Scenario: Listing with shared deadline gets deleted
    Given one task
    And one listing
    And the listing and the task share a deadline
    When the listing is deleted
    Then the deadline should not be deleted

  Scenario: Task with shared deadline gets deleted
    Given one task
    And one listing
    And the listing and the task share a deadline
    When the task is deleted
    Then the deadline should not be deleted