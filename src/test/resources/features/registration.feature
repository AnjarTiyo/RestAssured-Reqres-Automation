@regisration
Feature: User regisration
  Register new user with given json data. Method used is POST.

  Note: Json data created based on parameter not File. So json body for input isn't necessary.
  Test is validated based on status code, body responses manually and using json schema validator

  @tugas
  Scenario Outline: Successful register new User(s)
    Given I post register valid new user with email "<email>", password "<password>", note: "<note>"
    When Send request post register new user
    Then Status code should be "<status>" - "<detail>"
    And Response body "<body_resp>" should return "<response>"
    And Assert that response body match json schema "<json_schema>"
    Examples:
      | email              | password | note         | status | detail      | response                                      | body_resp | json_schema                      |
      | eve.holt@reqres.in | pistol   | ValidData    | 200    | OK          | token                                         | token     | postRegisterUserSchema.json      |
      | eve.holt@reqres.in |          | NoPassword   | 400    | Bad Request | Missing password                              | error     | postRegisterUserSchemaError.json |
      | not.an.email       | pistol   | InvalidEmail | 400    | Bad Request | Note: Only defined users succeed registration | error     | postRegisterUserSchemaError.json |
      |                    | pistol   | NoEmail      | 400    | Bad Request | Missing email                                 | error     | postRegisterUserSchemaError.json |
      |                    |          | NoData       | 400    | Bad Request | Missing email                                 | error     | postRegisterUserSchemaError.json |