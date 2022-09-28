<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/AnjarTiyo/RestAssured-Reqres-Automation">
    <img src="https://avatars0.githubusercontent.com/u/19369327?s=400&v=4" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Reqres.in API Automated Testing</h3>

  <p align="center">
    Reqres.in API automated testing using Rest Assured
    <br />
    <a href="https://github.com/AnjarTiyo/RestAssured-Reqres-Automation"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/AnjarTiyo/RestAssured-Reqres-Automation">View Demo</a>
    ·
    <a href="https://github.com/AnjarTiyo/RestAssured-Reqres-Automation">Report Bug</a>
    ·
    <a href="https://github.com/AnjarTiyo/RestAssured-Reqres-Automation">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#feature-tested">Feature Tested</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

Here is my project using Rest Assured to Automate API testing on reqres.in. I also implement gherkin languange as main feature of this test. So it's quite easy to understand what to test and how the test work. 

This project is based on ***[Reqres - A freely available REST API.](https://reqres.in)***

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [Java 1.8](https://www.oracle.com/java/technologies/downloads/)
* [Intellij IDEA]()
* [Maven]()

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.


### Installation

#### Method 1: Trough terminal (Maven Should be Installed)

1. Clone the repo
   ```sh
   git clone https://github.com/AnjarTiyo/RestAssured-Reqres-Automation.git
   ```
3. Go to project directory
   ```sh
   cd RestAssured-Reqres-Automation
   ```
4. run Maven command
   ```sh
   mvn clean verify
   ```
#### Method 2: Trough Intellij IDEA

1. Create New Project
2. Select from "versioning control"
3. Paste https://github.com/AnjarTiyo/RestAssured-Reqres-Automation.git
4. Select JDK 1.8
5. Select maven
6. Click OK

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

```sh
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
```
  
_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- FEATURE TESTED -->
## Feature Tested

- [ ] Authorization
    - [ ] POST Login user  
- [ ] Registration
    - [ ] POST Register New User 
- [ ] Resources - USERS
    - [ ] GET All Users within page
    - [ ] GET Single Users with Id
    - [ ] POST Create New Users
    - [ ] PUT Update Users Attributes
    - [ ] DEL Existing Users

See the [open issues](https://github.com/AnjarTiyo/RestAssured-Reqres-Automation/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Anjar Tiyo Saputro - [@anjartiyo.s](https://www.instagram.com/anjartiyo.s/) - anjar.jog@gmail.com

Project Link: [https://github.com/AnjarTiyo/RestAssured-Reqres-Automation](https://github.com/AnjarTiyo/RestAssured-Reqres-Automation)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Alterra Academy](https://academy.alterra.id/)
* [Rest Assured](https://github.com/rest-assured/rest-assured)
* [My Mentor - Wisnu Munawar](https://github.com/wisnuwm)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/AnjarTiyo/RestAssured-Reqres-Automation.svg?style=for-the-badge
[contributors-url]: https://github.com/AnjarTiyo/RestAssured-Reqres-Automation/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/AnjarTiyo/RestAssured-Reqres-Automation.svg?style=for-the-badge
[forks-url]: https://github.com/AnjarTiyo/RestAssured-Reqres-Automation/network/members
[stars-shield]: https://img.shields.io/github/stars/AnjarTiyo/RestAssured-Reqres-Automation.svg?style=for-the-badge
[stars-url]: https://github.com/AnjarTiyo/RestAssured-Reqres-Automation/stargazers
[issues-shield]: https://img.shields.io/github/issues/AnjarTiyo/RestAssured-Reqres-Automation.svg?style=for-the-badge
[issues-url]: https://github.com/AnjarTiyo/RestAssured-Reqres-Automation/issues
[license-shield]: https://img.shields.io/github/license/AnjarTiyo/RestAssured-Reqres-Automation.svg?style=for-the-badge
[license-url]: https://github.com/AnjarTiyo/RestAssured-Reqres-Automation/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/anjartiyo
[product-screenshot]: src/docs/Screenshot_2022-09-28_14_01_25.png
