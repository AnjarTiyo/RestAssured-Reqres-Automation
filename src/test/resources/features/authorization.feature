@smoke @authorization
Feature: Authorization

  Scenario Outline: Login functionallity
    Given I post login with email "<username>" and password "<password>", note: "<note>"
    When Send request post login user
    Then Status code should be "<status>" - "<detail>"
    And Response body should contain "<response>"
    Examples:
      | username           | password       | status | detail      | response                  | note                        |
      | eve.holt@reqres.in | cityslicka     | 200    | OK          | token                     | valid username and password |
      | not.an.email       | cityslicka     | 400    | Bad Request | user not found            | invalid username            |
      | eve.holt@reqres.in | wrong_password | 400    | Bad Request | Wrong password            | invalid password            |
      | eve.holt@reqres.in |                | 400    | Bad Request | Missing password          | no password                 |
      |                    | cityslicka     | 400    | Bad Request | Missing email or username | no username                 |
      |                    |                | 400    | Bad Request | Missing email or username | no data                     |