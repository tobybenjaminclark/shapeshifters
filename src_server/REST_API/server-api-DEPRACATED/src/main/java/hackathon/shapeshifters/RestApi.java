package hackathon.shapeshifters;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Collections;
import java.util.Map;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.context.annotation.Bean;
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

  private static float accuracyA;
  private static float accuracyB;

  /**
   * The main entry point to run the Server Rest API.
   */
  public static void main(String[] args) {
    readyA = false;
    readyB = false;
    SpringApplication app = new SpringApplication(RestApi.class);
    app.setDefaultProperties(Collections.singletonMap("server.port", "8083"));
    SpringApplication.run(RestApi.class, args);
    app.setDefaultProperties(Collections.singletonMap("server.address", "0.0.0.0"));
  }

  @Bean
  public ConfigurableServletWebServerFactory webServerFactory() throws UnknownHostException {
      TomcatServletWebServerFactory factory = new TomcatServletWebServerFactory();
      factory.setAddress(InetAddress.getByName("0.0.0.0")); // Set server address
      return factory;
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
          .add("Recieved", true);

    JsonObject json = builder.build();

    return json.toString();
  }

  @GetMapping(
    value = "/getReady", 
    produces = MediaType.APPLICATION_JSON_VALUE)
  public String getReady() {
    JsonObjectBuilder builder = Json.createObjectBuilder();
    if (readyA && readyB) {
      builder.add("Ready", true);
    } else {
      builder.add("Ready", false);
    }
    JsonObject json = builder.build();
    return json.toString();
  }

  @PostMapping(
      value = "/submitAccuracy", 
      produces = MediaType.APPLICATION_JSON_VALUE)
  public String submitAccuracy(@RequestBody Map<String, String> request) {
    String identifier = request.get("ID");
    String accuracyString = request.get("Accuracy");
    float accuracy = Float.parseFloat(accuracyString);

    if (identifier.equals("A")) {
      accuracyA = accuracy;
    } 
    else if (identifier.equals("B")) {
      accuracyB = accuracy;
    }
    

    Thread thread = new Thread(() -> {
      try {
        Thread.sleep(15000); // Sleep for 5 seconds (5000 milliseconds)
        System.out.println("Thread woke up after 5 seconds, now set both to false");
        accuracyA = -1; accuracyB = -1;
      } catch (InterruptedException e) {
        // Handle interruption
      }
    });
  
    thread.start(); // Start the thread

    JsonObjectBuilder builder = Json.createObjectBuilder()
          .add("Recieved", true);

    JsonObject json = builder.build();

    return json.toString();
  }

  @GetMapping(
    value = "/getAccuracy", 
    produces = MediaType.APPLICATION_JSON_VALUE)
  public String getAccuracy() {
    JsonObjectBuilder builder = Json.createObjectBuilder();
    if (accuracyA > 0 && accuracyB > 0) {
      if (accuracyA > accuracyB) {
        builder.add("Winner", "A");
      } else {
        builder.add("Winner", "B");
      }
      
    } else {
      builder.add("Winner", "None");
    }
    JsonObject json = builder.build();
    return json.toString();
  }
}