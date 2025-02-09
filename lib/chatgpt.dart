import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GPTService {
  Future<String> getResponse(Map<String, dynamic> userCycleData) async {
    // Load API key from environment variables
    final apiKey = dotenv.env['API_KEY'] ?? 'YOUR_NEW_API_KEY';

    final prompt = generatePrompt(userCycleData);

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'), // Use the correct endpoint
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: json.encode({
          "model": "gpt-3.5-turbo", // Ensure you're using the right model
          "messages": [
            {"role": "system", "content": "You are a fitness and meal plan assistant."},
            {"role": "user", "content": prompt},
          ]
        }),
      );

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        return decoded['choices'][0]['message']['content'].toString();
      } else {
        // Log the error if the response is not successful
        print("Error: ${response.statusCode} - ${response.body}");
        return "Error fetching response. Response Error!.";
      }
    } catch (e) {
      // Catch any errors in the request and log them
      print("Request error: $e");
      return "Error fetching response. Please try again.";
    }
  }

  String generatePrompt(Map<String, dynamic> data) {
    return "Based on age ${data['age']}, last period on ${data['lastPeriod']}, "
        "average period length of ${data['avgPeriodLength']} days, and average cycle length "
        "of ${data['avgCycleLength']} days, recommend either workouts or meals for this individual.";
  }
}
