package example;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;

public class StepDefs {

    private Example example;

    @Given("^prerequisites$")
    public void prerequisites() throws Throwable {
        example = new Example();
        Assert.assertFalse(example.value);
    }

    @When("^something happens$")
    public void somethingHappens() throws Throwable {
        example.amazingFunction();
    }

    @Then("^result is as expected$")
    public void resultIsAsExpected() throws Throwable {
        Assert.assertTrue(example.value);
    }
}
