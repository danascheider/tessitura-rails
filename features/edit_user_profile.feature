Feature: Edit user profile

  Scenario: Authorized user edits their profile
    Given I am a logged-in user
    And I am viewing my profile edit form
    When I change my birthdate to '1987-05-15'
    Then my birthdate should be '1987-05-15'
    And I should be on the profile page