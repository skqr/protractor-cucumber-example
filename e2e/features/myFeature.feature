Feature: Running Cucumber with Protractor
  As a user of Protractor
  I should be able to use Cucumber
  to run my E2E tests

  Scenario: Wrapping WebDriver
    Given I go on "http://juliemr.github.io/protractor-demo/"
    Then the title should equal "Super Calculator"

  Scenario Outline: Adding some numbers
    Given I go on "http://juliemr.github.io/protractor-demo/"
    And I enter <first_addend> and <second_addend> as addends
    When I press Go!
    Then the result should equal <sum>
    And the history should list "<first_addend> + <second_addend>"

    Examples:
        | first_addend | second_addend | sum |
        | 6            | 5             | 11  |
        | 20           | 7             | 27  |
        | 5            | 79            | 84  |
