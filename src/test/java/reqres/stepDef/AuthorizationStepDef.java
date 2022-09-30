package reqres.stepDef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import reqres.step.ReqresAPI;

import java.io.File;
import io.restassured.module.jsv.JsonSchemaValidator;

public class AuthorizationStepDef {
    @Steps
    ReqresAPI req;
    private static final String resources = "login";

    @Given("I post login with email {string} and password {string}, note: {string}")
    public void postLoginWithJson(String username, String password, String note){
        req.postUser(username, password);
    }

    @When("Send request post login user")
    public void sendRequestPostLoginUser() {
        SerenityRest.when().post(req.URL+resources);
    }

    @And("Assert that response body match json schema {string}")
    public void assertThatResponseBodyMatchJsonSchema(String file) {
       req.jsonSchemaValidate(file);
    }
}
