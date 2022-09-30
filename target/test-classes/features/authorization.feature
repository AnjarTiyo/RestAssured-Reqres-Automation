@authorization
Feature: Authorization

  @tugas
  Scenario Outline: Login functionallity
    Given I post login with email "<username>" and password "<password>", note: "<note>"
    When Send request post login user
    Then Status code should be "<status>" - "<detail>"
    And Response body "<body_resp>" should return "<response>"
    And Assert that response body match json schema "<json_schema>"
    Examples:
      | username           | password       | status | detail      | response                  | note                        | body_resp | json_schema                       |
      | eve.holt@reqres.in | cityslicka     | 200    | OK          | token                     | valid username and password | token     | postAuthorizationSchema.json      |
      | not.an.email       | cityslicka     | 400    | Bad Request | user not found            | invalid username            | error     | postAuthorizationSchemaError.json |
      | eve.holt@reqres.in | wrong_password | 400    | Bad Request | Wrong password            | invalid password            | error     | postAuthorizationSchemaError.json |
      | eve.holt@reqres.in |                | 400    | Bad Request | Missing password          | no password                 | error     | postAuthorizationSchemaError.json |
      |                    | cityslicka     | 400    | Bad Request | Missing email or username | no username                 | error     | postAuthorizationSchemaError.json |
      |                    |                | 400    | Bad Request | Missing email or username | no data                     | error     | postAuthorizationSchemaError.json |