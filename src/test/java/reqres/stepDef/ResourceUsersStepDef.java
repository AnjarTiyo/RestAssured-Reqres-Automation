package reqres.stepDef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import reqres.step.ReqresAPI;

import java.util.Collections;

import static org.hamcrest.core.IsNull.nullValue;

public class ResourceUsersStepDef {
    @Steps
    ReqresAPI req;
    @Given("Get list of all users")
    public void getListAllUser(){
        SerenityRest.given().baseUri(req.GET_LIST_ALL_USERS);
        //req.getUserPage("all");
    }

    @When("Send request get all users")
    public void sendRequestGetAllUsers() {
        SerenityRest.when().get(req.GET_LIST_ALL_USERS);
    }

    @Given("Get USERS within page {string}")
    public void getUSERSWithinPage(String pageNumber) {
        req.getUserPage(pageNumber);
        //SerenityRest.given().pathParam("page", pageNumber);
    }

    @When("Send request get list users within page {string}")
    public void sendRequestGetListUsersWithinPage(String param) {
        SerenityRest.when().get(req.GET_LIST_USERS_PAGE);
    }


    @Given("Get USERS data with id {string}")
    public void getUSERSDataWithId(String id) {
        req.getUserData(id);
    }

    @When("Send request get users data with id {string}")
    public void sendRequestGetUsersDataWithId(String id) {
        SerenityRest.when().get(req.GET_DATA_USERS_ID);
    }

    @Given("Post new USERS with name {string} and job {string}")
    public void postNewUSERSWithNameAndJob(String name, String job) {
        req.postNewUser(name, job);
    }

    @When("Send request post create user")
    public void sendRequestPostCreateUser() {
        SerenityRest.when().post(req.POST_NEW_USERS);
    }

    @Given("Put update USERS attributes id {string} with name {string} and job {string}")
    public void putUpdateUSERSAttributesIdWithNameAndJob(String id, String name, String job) {
        req.putUser(id, name, job);
    }

    @When("Send request put update USERS attributes")
    public void sendRequestPutUpdateUSERSAttributes() {
        SerenityRest.when().put(req.PUT_UPDATE_USERS);
    }

    @Given("Delete existing users with id {string}")
    public void deleteExistingUsersWithId(String id) {
        req.delUser(id);
    }

    @When("Send request delete existing users")
    public void sendRequestDeleteExistingUsers() {
        SerenityRest.when().delete(req.DEL_USERS);
    }

    @And("Response body should return {string}")
    public void responseBodyShouldReturn(String response) {
        SerenityRest.then().equals("");
    }

    @And("Response body {string} should return {string}")
    public void responseBodyShouldReturn(String body_resp, String response) {
    }
}
