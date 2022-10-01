@unknown
Feature: resources-unknown
  CRUD unknown data with GET, POST, PUT and DELETE method.

  Note: Json data created based on parameter not File. So json body for input isn't necessary.
  Test is validated based on status code, body responses manually and using json schema validator

  @get @tugas
  Scenario: Get list of all UNKNOWN
    Given Get list of all "unknown"
    When Send request get all "unknown"
    Then Status code should be "200" - "OK"
    And Response body "page" should return "1"
    And Assert that response body match json schema "getListAllUnknownSchema.json"

  @get @tugas
  Scenario Outline: Get list of UNKNOWN within page
    Given Get "unknown" within page "<page>"
    When Send request get list "unknown" within page "<page>"
    Then Status code should be "<status>" - "<detail>"
    And Response body "<body_resp>" should return "<response>"
    And Assert that response body match json schema "<json_schema>"
    Examples:
      | page | status | detail     | body_resp | response | json_schema                   |
      | 1    | 200    | OK         | page      | 1        | getListUnknownPageSchema.json |
      | 2    | 200    | OK         | page      | 2        | getListUnknownPageSchema.json |
      | 3    | 204    | No Content | page      | Null     | empty.json                    |
      | a    | 204    | No Content | page      | Null     | empty.json                    |
      |      | 200    | OK         | page      | 1        | getListUnknownPageSchema.json |

  @get @tugas
  Scenario Outline: Get single user data with id
    Given Get "unknown" data with id "<id>"
    When Send request get "unknown" data with id "<id>"
    Then Status code should be "<status>" - "<detail>"
    And Response body "<body_resp>" should return "<response>"
    And Assert that response body match json schema "<json_schema>"
    Examples:
      | id | status | detail    | body_resp | response | json_schema                 |
      | 1  | 200    | OK        | id        | 1        | getSingleUnknownSchema.json |
      | 20 | 404    | Not Found | data      | null     | empty.json                  |
      | aa | 404    | Not Found | data      | null     | empty.json                  |

  @delete @tugas
  Scenario Outline: Delete existing UNKNOWN
    Given Delete existing "unknown" with id "<id>"
    When Send request delete existing "unknown"
    Then Status code should be "<status>" - "<detail>"
    And Response body should return "<response>"
    Examples:
      | id   | status | detail      | response | note              |
      | 2    | 204    | No Content  | null     | valid existing id |
      | 1024 | 400    | Bad Request | blocked  | not existing id   |
      | aa   | 400    | Bad Request | blocked  | invalid id format |
      |      | 400    | Bad Request | blocked  | no parameter      |