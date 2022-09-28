package reqres.stepDef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import reqres.step.ReqresAPI;

public class RegistrationStepDef {
    //Bismillah
    @Steps
    ReqresAPI req;

    private static final String resources = "register";

    @Given("I post register valid new user with email {string}, password {string}, note: {string}")
    public void postRegisterNewUserWithJsonFile(String email, String password, String note){
        req.postUser(email, password);
    }

    @When("Send request post register new user")
    public void sendRequestPostRegisterUser() {
        SerenityRest.when().post(req.URL+ resources);
    }

    @Then("Status code should be {string} - {string}")
    public void statusCodeShouldBeOK(String status, String detail) {
        String str = status;
        int t = Integer.parseInt(str);
        SerenityRest.then().statusCode(t);
    }

}
