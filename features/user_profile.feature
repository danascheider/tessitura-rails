Feature: User profile

  Background:
    Given I am a logged-in user
    And I'm viewing my profile

  @javascript
  Scenario Outline: Show inputs
    When I double-click on the '<element>' field
    Then an input should appear in the <element> field
    And the input should contain my <element>
    And I should not see the 'span.p' element in the <element> field

    Examples:
      | element    |
      | email      |
      | first_name |
      | last_name  |
      | birthdate  |
      | address_1  |
      | address_2  |
      | city       |
      | state      |
      | zip        |