Feature: Homepage
  Background:
    Given I am on the homepage

  Scenario: Visiting the homepage
    Then I should see the top navbar
    And I should see a link to the 'About' view
    And I should see a link to the 'Sign Up' view
    And I should see a link to the 'Contact' view

  Scenario Outline: Homepage sections
    When I click the '<link>' link
    Then I should see the <id> view

    Examples:
      | link    | id       |
      | About   | about    |
      | Sign Up | register |
      | Contact | contact  |

  Scenario: Create a valid new user
    Given there are no users
    When I submit the registration form with valid attributes
    Then there should be 1 user
    And I should get a confirmation e-mail
    And I should be rerouted to my dashboard

  Scenario: Attempt to create an invalid new user
    Given there are no users
    When I submit the registration form with invalid attributes
    Then there should be no users
    And I should not get a confirmation e-mail
    And I should be on the homepage
    And I should see a message that the user was not saved