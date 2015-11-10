Feature: Homepage

  Scenario: Visiting the homepage
    Given I am on the homepage
    Then I should see the top navbar
    And I should see a link to the 'About' view
    And I should see a link to the 'Sign Up' view
    And I should see a link to the 'Contact' view

  Scenario Outline: Homepage sections
    Given I am on the homepage
    When I click the '<link>' link
    Then I should see the <id> view

    Examples:
      | link    | id       |
      | About   | about    |
      | Sign Up | register |
      | Contact | contact  |

  Scenario: Create a valid new user
    Given I am on the homepage
    When I submit the registration form with valid attributes
    Then a new user should be created
    And I should get a confirmation e-mail
    And I should be rerouted to my dashboard