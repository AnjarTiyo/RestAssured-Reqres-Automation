@users
Feature: resources-user
  CRUD users data with GET, POST, PUT and DELETE method.

  Note: Json data created based on parameter not File. So json body for input isn't necessary.
  Test is validated based on status code, body responses manually and using json schema validator

  @get @tugas
  Scenario: Get list of all USERS
    Given Get list of all "users"
    When Send request get all "users"
    Then Status code should be "200" - "OK"
    And Response body "page" should return "1"
    And Assert that response body match json schema "getListAllUsersSchema.json"

  @get @tugas
  Scenario Outline: Get list of USERS within page
    Given Get "users" within page "<page>"
    When Send request get list "users" within page "<page>"
    Then Status code should be "<status>" - "<detail>"
    And Response body "<body_resp>" should return "<response>"
    And Assert that response body match json schema "<json_schema>"
    Examples:
      | page | status | detail     | body_resp | response | json_schema                 |
      | 1    | 200    | OK         | page      | 1        | getListUsersPageSchema.json |
      | 2    | 200    | OK         | page      | 2        | getListUsersPageSchema.json |
      | 3    | 204    | No Content | page      | Null     | empty.json                  |
      | a    | 204    | No Content | page      | Null     | empty.json                  |
      |      | 200    | OK         | page      | 1        | getListUsersPageSchema.json |

  @get @tugas
  Scenario Outline: Get single user data with id
    Given Get "users" data with id "<id>"
    When Send request get "users" data with id "<id>"
    Then Status code should be "<status>" - "<detail>"
    And Response body "<body_resp>" should return "<response>"
    And Assert that response body match json schema "<json_schema>"
    Examples:
      | id | status | detail    | body_resp | response | json_schema              |
      | 1  | 200    | OK        | id        | 1        | getSingleUserSchema.json |
      | 20 | 404    | Not Found | data      | null     | empty.json               |
      | aa | 404    | Not Found | data      | null     | empty.json               |

  @post @tugas
  Scenario Outline: Post new USERS
    Given Post new "users" with name "<name>" and job "<job>"
    When Send request post create "users"
    Then Status code should be "<status>" - "<detail>"
    And Response body "name" should return "<name>"
    And Response body "job" should return "<job>"
    And Response body "id" should return "<response_id>"
    And Response body "createdAt" should return "<response_created>"
    And Assert that response body match json schema "<json_schema>"
    Examples:
      | name  | job         | status | detail      | response_id | response_created | json_schema                 |
      | Anjar | QA Engineer | 201    | Created     | notNull     | notNull          | postNewUserSchema.json      |
      |       | QA Engineer | 201    | Created     | notNull     | notNull          | postNewUserSchema.json      |
      | Anjar |             | 201    | Created     | notNull     | notNull          | postNewUserSchema.json      |
      |       |             | 400    | Bad Request | null        | null             | postNewUserSchemaError.json |

  @put @tugas
  Scenario Outline: Put update USERS attributes
    Given Put update USERS attributes id "<id>" with name "<name>" and job "<job>"
    When Send request put update USERS attributes
    Then Status code should be "<status>" - "<detail>"
    And Response body "name" should return "<name>"
    And Response body "job" should return "<job>"
    And Response body "updatedAt" should return "<response>"
    And Assert that response body match json schema "<json_schema>"
    Examples:
      | id   | name       | job       | status | detail      | response | json_schema                    | notes           |
      | 2    | Anjar Tiyo | QA Update | 200    | OK          | notNull  | putUpdateUsersSchema.json      | valid request   |
      | 2    |            |           | 400    | Bad Request | null     | putUpdateUsersSchemaError.json | no data         |
      | 1024 | Anjar Tiyo | QA Update | 400    | Bad Request | null     | putUpdateUsersSchemaError.json | id doesnt exist |
      | aa   | Anjar Tiyo | QA Update | 400    | Bad Request | null     | putUpdateUsersSchemaError.json | invalid id      |

  @delete @tugas
  Scenario Outline: Delete existing USERS
    Given Delete existing "users" with id "<id>"
    When Send request delete existing "users"
    Then Status code should be "<status>" - "<detail>"
    And Response body should return "<response>"
    Examples:
      | id   | status | detail      | response | note              |
      | 2    | 204    | No Content  | null     | valid existing id |
      | 1024 | 400    | Bad Request | blocked  | not existing id   |
      | aa   | 400    | Bad Request | blocked  | invalid id format |
      |      | 400    | Bad Request | blocked  | no parameter      |