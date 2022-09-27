package reqres.step;

import io.restassured.http.ContentType;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;
import reqres.env.TestEnv;
import reqres.responses.ReqresResponses;

import java.util.HashMap;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.notNullValue;

public class ReqresAPI {
    @Steps
    ReqresResponses resp;

    @Steps
    static TestEnv test;
    public static final String URL = TestEnv.BASE_URL;

    @Step
    public void postUser(String email, String password) {
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
                    .body(resp.TOKEN, notNullValue());
        }else {
            SerenityRest.then()
                    .body(resp.ERROR, containsString(response));
        }
    }


}
