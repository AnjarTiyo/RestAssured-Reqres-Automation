package reqres.step;

import io.restassured.http.ContentType;
import io.restassured.module.jsv.JsonSchemaValidator;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.annotations.Managed;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import reqres.env.TestEnv;
import reqres.responses.ReqresResponses;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import static org.hamcrest.Matchers.*;

public class ReqresAPI {

    @Managed
    WebDriver driver;
    @Steps
    static TestEnv test;
    public static final String URL = test.BASE_URL;
    public static String GET_LIST_ALL_USERS = URL + "users";
    public static String POST_NEW_USERS = GET_LIST_ALL_USERS;
    public static String GET_LIST_USERS_PAGE = URL + "users?page={page}";
    public static String GET_DATA_USERS_ID = URL + "users/{id}";
    public static String PUT_UPDATE_USERS = GET_DATA_USERS_ID;
    public static String DEL_USERS = GET_DATA_USERS_ID;
    public static String JSON_FILE = "src/test/resources/json/";
    @Steps
    ReqresResponses resp;

    @Step
    public void postUser(String email, String password) {
        HashMap<String, Object> json = new HashMap<String, Object>();
        json.put("email", email);
        json.put("password", password);

        SerenityRest.given().contentType(ContentType.JSON).body(json);
    }

    @Step
    public void validateResponse(String body_resp, String response) {
        if (response.equals("null")) {
            SerenityRest.then().equals("");
        } else if (response.equals("notNull")) {
            SerenityRest.then().body(notNullValue());
        } else if (body_resp.equals("id")) {
            SerenityRest.then().body(resp.ID, notNullValue());
        } else if (body_resp.equals("token")) {
            SerenityRest.then().body(resp.TOKEN, notNullValue());
        } else if (body_resp.equals("page")) {
            SerenityRest.then().body(resp.PAGE, is(Integer.parseInt(response)));
        } else if (body_resp.equals("createdAt")) {
            SerenityRest.then().body(resp.CREATED, notNullValue());
        } else if (body_resp.equals("updatedAt")) {
            SerenityRest.then().body(resp.UPDATED, notNullValue());
        } else {
            SerenityRest.then().body(containsString(response));
        }
    }

    @Step
    public void getUserPage(String param) {
        SerenityRest.given().pathParams("page", param);
    }

    @Step
    public void getUserData(String id) {
        SerenityRest.given().pathParams("id", id);
    }

    @Step
    public void postNewUser(String name, String job) {
        HashMap<String, Object> json = new HashMap<String, Object>();
        json.put("name", name);
        json.put("job", job);

        SerenityRest.given().contentType(ContentType.JSON).body(json);
    }

    @Step
    public void putUser(String id, String name, String job) {
        HashMap<String, Object> json = new HashMap<String, Object>();
        json.put("name", name);
        json.put("job", job);

        SerenityRest.given().pathParams("id", id).contentType(ContentType.JSON).body(json);
    }

    @Step
    public void delUser(String id) {
        SerenityRest.given().pathParams("id", id);
    }
    @Step
    public void jsonSchemaValidate(String file){
        Path path = Paths.get(JSON_FILE+file);
        if(Files.exists(path)){
            File json = new File(JSON_FILE+file);
            SerenityRest.then().assertThat()
                    .body(JsonSchemaValidator.matchesJsonSchema(json));
        }else{
            //createJsonSchema(file, "post");
            File json = new File(JSON_FILE+file);
            SerenityRest.then().assertThat()
                    .body(JsonSchemaValidator.matchesJsonSchema(json));
        }
    }

    @Step
    public void createJsonSchema(String file, String method){
        if (method.equals("post")) {
//            @DefaultUrl("https://jsonformatter.org/json-to-jsonschema")
//            driver.findElement(By.id("path")).sendKeys(SerenityRest.when().post(URL+"login"));
//            SerenityRest.when().post(URL+"login");
        }
    }
}
