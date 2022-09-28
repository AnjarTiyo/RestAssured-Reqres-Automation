@authorization
Feature: Authorization

  Scenario Outline: Login functionallity
    Given I post login with email "<username>" and password "<password>", note: "<note>"
    When Send request post login user
    Then Status code should be "<status>" - "<detail>"
    And Response body "<body_resp>" should return "<response>"
    Examples:
      | username           | password       | status | detail      | response                  | note                        |body_resp|
      | eve.holt@reqres.in | cityslicka     | 200    | OK          | token                     | valid username and password |token    |
      | not.an.email       | cityslicka     | 400    | Bad Request | user not found            | invalid username            |error    |
      | eve.holt@reqres.in | wrong_password | 400    | Bad Request | Wrong password            | invalid password            |error    |
      | eve.holt@reqres.in |                | 400    | Bad Request | Missing password          | no password                 |error    |
      |                    | cityslicka     | 400    | Bad Request | Missing email or username | no username                 |error    |
      |                    |                | 400    | Bad Request | Missing email or username | no data                     |error    |