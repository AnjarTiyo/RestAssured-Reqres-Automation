package reqres.stepDef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import reqres.responses.RegistrationResponses;
import reqres.step.RegistrationAPI;

import java.io.File;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.notNullValue;

public class RegistrationStepDef {
    //Bismillah
    @Steps
    RegistrationAPI reg;
    RegistrationResponses regResp;

    @Given("Post register valid new user with email {string}, password {string}, note: {string}")
    public void postRegisterNewUserWithJsonFile(String email, String password, String note){
        reg.postRegisterUser(email, password);
    }

    @When("Send request post create user")
    public void sendRequestPostCreateUser() {
        SerenityRest.when().post(reg.URL+reg.resource);
    }

    @Then("Status code should be {string} - {string}")
    public void statusCodeShouldBeOK(String status, String detail) {
        String str = status;
        int t = Integer.parseInt(str);
        SerenityRest.then().statusCode(t);
    }

    @And("Response body should contain {string}")
    public void responseBodyShouldContainAnd(String response) {
        reg.validateResponse(response);
    }
}
