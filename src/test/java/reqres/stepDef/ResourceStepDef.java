package reqres.stepDef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import reqres.step.ReqresAPI;

import static org.hamcrest.core.IsNull.nullValue;

public class ResourceStepDef {
    @Steps
    ReqresAPI req;
    @Given("Get list of all {string}")
    public void getListAllUser(String resource){
        SerenityRest.given().baseUri(req.URL+resource);
        //req.getUserPage("all");
    }

    @When("Send request get all {string}")
    public void sendRequestGetAllUsers(String resource) {
        SerenityRest.when().get(req.URL+resource);
    }

    @Given("Get {string} within page {string}")
    public void getUSERSWithinPage(String resource, String pageNumber) {
        req.getUserPage(pageNumber);
        //SerenityRest.given().pathParam("page", pageNumber);
    }

    @When("Send request get list {string} within page {string}")
    public void sendRequestGetListUsersWithinPage(String resource, String param) {
        SerenityRest.when().get(req.URL+resource+"?page={page}");
    }


    @Given("Get {string} data with id {string}")
    public void getUSERSDataWithId(String resource, String id) {
        req.getUserData(id);
    }

    @When("Send request get {string} data with id {string}")
    public void sendRequestGetUsersDataWithId(String resource, String id) {
        SerenityRest.when().get(req.URL+resource+"/{id}");
    }

    @Given("Post new {string} with name {string} and job {string}")
    public void postNewUSERSWithNameAndJob(String resource, String name, String job) {
        req.postNewUser(name, job);
    }

    @When("Send request post create {string}")
    public void sendRequestPostCreateUser(String resource) {
        SerenityRest.when().post(req.URL+resource);
    }

    @Given("Put update USERS attributes id {string} with name {string} and job {string}")
    public void putUpdateUSERSAttributesIdWithNameAndJob(String id, String name, String job) {
        req.putUser(id, name, job);
    }

    @When("Send request put update USERS attributes")
    public void sendRequestPutUpdateUSERSAttributes() {
        SerenityRest.when().put(req.PUT_UPDATE_USERS);
    }

    @Given("Delete existing {string} with id {string}")
    public void deleteExistingUsersWithId(String resource,String id) {
        req.delUser(id);
    }

    @When("Send request delete existing {string}")
    public void sendRequestDeleteExistingUsers(String resource) {
        SerenityRest.when().delete(req.URL+resource+"/{id}");
    }

    @And("Response body should return {string}")
    public void responseBodyShouldReturn(String response) {
        SerenityRest.then().equals("");
    }

    @And("Response body {string} should return {string}")
    public void responseBodyShouldReturn(String body_resp, String response) {
        req.validateResponse(body_resp, response);
    }

}
