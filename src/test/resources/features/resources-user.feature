@users
Feature: resources-user

  @get
  Scenario: Get list of all USERS
    Given Get list of all users
    When Send request get all users
    Then Status code should be "200" - "OK"
    And Response body "page" should return "1"

  @get
  Scenario Outline: Get list of USERS within page
    Given Get USERS within page "<page>"
    When Send request get list users within page "<page>"
    Then Status code should be "<status>" - "<detail>"
    And Response body "<body_resp>" should return "<response>"
    Examples:
      | page | status | detail     | body_resp | response |
      | 1    | 200    | OK         | page      | 1        |
      | 2    | 200    | OK         | page      | 2        |
      | 3    | 204    | No Content | page      | Null     |
      | a    | 204    | No Content | page      | Null     |
      |      | 200    | OK         | page      | 1        |

  @get
  Scenario Outline: Get single user data with id
    Given Get USERS data with id "<id>"
    When Send request get users data with id "<id>"
    Then Status code should be "<status>" - "<detail>"
    And Response body "<body_resp>" should return "<response>"
    Examples:
      | id | status | detail    | body_resp | response |
      | 1  | 200    | OK        | id        | 1        |
      | 20 | 404    | Not Found | data      | null     |
      | aa | 404    | Not Found | data      | null     |

  @post
  Scenario Outline: Post new USERS
    Given Post new USERS with name "<name>" and job "<job>"
    When Send request post create user
    Then Status code should be "<status>" - "<detail>"
    And Response body "name" should return "<name>"
    And Response body "job" should return "<job>"
    And Response body "id" should return "<response_id>"
    And Response body "createdAt" should return "<response_created>"
    Examples:
      | name  | job         | status | detail      | response_id | response_created |
      | Anjar | QA Engineer | 201    | Created     | notNull     | notNull          |
      |       | QA Engineer | 201    | Created     | notNull     | notNull          |
      | Anjar | QA Engineer | 201    | Created     | notNull     | notNull          |
      |       |             | 400    | Bad Request | null        | null             |

  @put
  Scenario Outline: Put update USERS attributes
    Given Put update USERS attributes id "<id>" with name "<name>" and job "<job>"
    When Send request put update USERS attributes
    Then Status code should be "<status>" - "<detail>"
    And Response body "name" should return "<name>"
    And Response body "job" should return "<job>"
    And Response body "updatedAt" should return "<response>"
    Examples:
      | id   | name       | job       | status | detail      | response | notes           |
      | 2    | Anjar Tiyo | QA Update | 200    | OK          | notNull  | valid request   |
      | 2    |            |           | 400    | Bad Request | null     | no data         |
      | 1024 | Anjar Tiyo | QA Update | 400    | Bad Request | null     | id doesnt exist |
      | aa   | Anjar Tiyo | QA Update | 400    | Bad Request | null     | invalid id      |

  @delete
  Scenario Outline: Delete existing USERS
    Given Delete existing users with id "<id>"
    When Send request delete existing users
    Then Status code should be "<status>" - "<detail>"
    And Response body should return "<response>"
    Examples:
      | id   | status | detail      | response | note              |
      | 2    | 204    | No Content  | null     | valid existing id |
      | 1024 | 400    | Bad Request | blocked  | not existing id   |
      | aa   | 400    | Bad Request | blocked  | invalid id format |
      |      | 400    | Bad Request | blocked  | no parameter      |