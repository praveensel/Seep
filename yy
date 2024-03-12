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

        // Initialize an array to store status of permissions with resource 'mmx' and permission 'CPOPYMTS_HighValue'
        List<String> statuses = new ArrayList<>();

        // Validate resource permission for each user
        for (JsonNode userNode : usersNode) {
            JsonNode resourcePermissionsNode = userNode.get("resourcepermission");
            if (resourcePermissionsNode != null && resourcePermissionsNode.isArray()) {
                for (JsonNode permissionNode : resourcePermissionsNode) {
                    JsonNode resourceNode = permissionNode.get("resource");
                    JsonNode permissionsArrayNode = permissionNode.get("permissions");
                    if (resourceNode != null && permissionsArrayNode != null && resourceNode.has("id") && permissionsArrayNode.isArray()) {
                        String resourceId = resourceNode.get("id").asText();
                        for (JsonNode permissionsNode : permissionsArrayNode) {
                            if (permissionsNode != null && permissionsNode.has("id")) {
                                String permissionsId = permissionsNode.get("id").asText();
                                if ("mmx".equals(resourceId) && "ppy".equals(permissionsId)) {
                                    String resourceStatus = resourceNode.get("status").asText();
                                    String permissionsStatus = permissionsNode.get("status").asText();
                                    statuses.add("Resource Status: " + resourceStatus + ", Permissions Status: " + permissionsStatus);
                                    // Break the loop if the conditions are met for performance optimization
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }

        // Print or return the array of statuses
        System.out.println("Statuses: " + statuses);
    }
}