import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ApiResponseValidator {

    public static void main(String[] args) throws IOException {
        // Parse the API response JSON string
        String apiResponse = ""; // Replace with your API response JSON string
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode responseNode = objectMapper.readTree(apiResponse);

        // Extract the data field containing the list of users
        JsonNode usersNode = responseNode.get("data");

        // Validate resource permission for each user
        for (JsonNode userNode : usersNode) {
            JsonNode resourcePermissionsNode = userNode.get("resourcepermission");
            if (resourcePermissionsNode != null && resourcePermissionsNode.isArray()) {
                for (JsonNode permissionNode : resourcePermissionsNode) {
                    JsonNode resourceNode = permissionNode.get("resource");
                    if (resourceNode != null && resourceNode.has("id")) {
                        String resourceId = resourceNode.get("id").asText();
                        if ("mmx".equals(resourceId)) {
                            String status = permissionNode.get("status").asText();
                            if ("Assigned".equals(status)) {
                                System.out.println("User " + userNode.get("userId").asText() + " has status 'Assigned' for resource 'mmx'.");
                                // You can add further validation logic or assertions here if needed
                            } else {
                                System.out.println("User " + userNode.get("userId").asText() + " does not have status 'Assigned' for resource 'mmx'.");
                                // You can handle the case where status is not 'Assigned' as needed
                            }
                        }
                    }
                }
            }
        }
    }
}