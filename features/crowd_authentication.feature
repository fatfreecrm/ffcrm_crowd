@javascript
Feature:
  In order to streamline user configuration
  Users
  should be able to authenticate with their existing user accounts via Crowd

  Scenario: User logs in with Crowd
    When I go to the login page
    And I fill in "Username" with "bobjones"
    And I fill in "Password" with "testing"
    And I press "Login"
    Then I should see "Welcome, bobjones!"
    And I should not see "Admin"

