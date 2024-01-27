package hackathon.shapeshifters;

import java.util.Map;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
@SpringBootApplication
@RequestMapping("/api")
public class RestApi {

  private static boolean readyA;
  private static boolean readyB;

  /**
   * The main entry point to run the Client Rest API.
   */
  public static void main(String[] args) {
    readyA = false;
    readyB = false;

    SpringApplication.run(RestApi.class, args);
  }

  @PostMapping(
      value = "/submitReady", 
      produces = MediaType.APPLICATION_JSON_VALUE)
  public String submitReady(@RequestBody Map<String, String> request) {
    String identifier = request.get("ID");

    if (identifier.equals("A")) {
      readyA = true;
    } 
    else if (identifier.equals("B")) {
      readyB = true;
    }
    

    Thread thread = new Thread(() -> {
      try {
        Thread.sleep(15000); // Sleep for 5 seconds (5000 milliseconds)
        System.out.println("Thread woke up after 5 seconds, now set both to false");
        readyA = false; readyB = false;
      } catch (InterruptedException e) {
        // Handle interruption
      }
    });
  
    thread.start(); // Start the thread

    JsonObjectBuilder builder = Json.createObjectBuilder()
          .add("recieved", true);

    JsonObject json = builder.build();

    return json.toString();
  }

  @GetMapping(
    value = "/getReady", 
    produces = MediaType.APPLICATION_JSON_VALUE)
  public String getReady() {
    JsonObjectBuilder builder = Json.createObjectBuilder();
    if (readyA && readyB) {
      builder.add("ready", true);
    } else {
      builder.add("ready", false);
    }
    JsonObject json = builder.build();
    return json.toString();
  }
}