package reqres.step;

import io.restassured.http.ContentType;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;
import reqres.env.TestEnv;
import reqres.responses.RegistrationResponses;

import java.util.HashMap;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.notNullValue;

public class RegistrationAPI {
    @Steps
    RegistrationResponses regresp;

    public static final String DIR = System.getProperty("user.dir");
    public static final String JSON_FILE = DIR + "/src/test/resources/Json/";
    public static final String resource = "register";
    //Bismillah
    @Steps
    static TestEnv test;
    public static final String URL = TestEnv.BASE_URL;

    @Step
    public void postRegisterUser(String email, String password) {
        HashMap<String, Object> json = new HashMap<String, Object>();
        json.put("email", email);
        json.put("password", password);

        SerenityRest.given()
                .contentType(ContentType.JSON)
                .body(json);
    }

    @Step
    public void validateResponse(String response){
        if(response.equals("token")){
            SerenityRest.then()
                    .body(regresp.ID, notNullValue())
                    .body(regresp.TOKEN, notNullValue());
        }else {
            SerenityRest.then()
                    .body(regresp.ERROR, containsString(response));
        }
    }


}
