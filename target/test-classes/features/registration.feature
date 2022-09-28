@smoke @regisration
Feature: User regisration

  Scenario Outline: Successful register new User(s)
    Given I post register valid new user with email "<email>", password "<password>", note: "<note>"
    When Send request post register new user
    Then Status code should be "<status>" - "<detail>"
    And Response body "<body_resp>" should return "<response>"
    Examples:
      | email              | password | note         | status | detail      | response                                      | body_resp |
      | eve.holt@reqres.in | pistol   | ValidData    | 200    | OK          | token                                         | token     |
      | eve.holt@reqres.in |          | NoPassword   | 400    | Bad Request | Missing password                              | error     |
      | not.an.email       | pistol   | InvalidEmail | 400    | Bad Request | Note: Only defined users succeed registration | error     |
      |                    | pistol   | NoEmail      | 400    | Bad Request | Missing email                                 | error     |
      |                    |          | NoData       | 400    | Bad Request | Missing email                                 | error     |

