@smoke @regisration
Feature: User regisration

  Scenario Outline: Successful register new User(s)
    Given I post register valid new user with email "<email>", password "<password>", note: "<note>"
    When Send request post create user
    Then Status code should be "<status>" - "<detail>"
    And Response body should contain "<response>"
    Examples:
      | email              | password | note         | status | detail      | response                                      |
      | eve.holt@reqres.in | pistol   | ValidData    | 200    | OK          | token                                         |
      | eve.holt@reqres.in |          | NoPassword   | 400    | Bad Request | Missing password                              |
      | not.an.email       | pistol   | InvalidEmail | 400    | Bad Request | Note: Only defined users succeed registration |
      |                    | pistol   | NoEmail      | 400    | Bad Request | Missing email                                 |
      |                    |          | NoData       | 400    | Bad Request | Missing email                                 |

