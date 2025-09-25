// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future checkAndAwardBadgesAction(String userId) async {
  // This is the name of your function in Supabase.
  const functionName = 'check_and_award_badges';

  // These are the parameters your Supabase function expects.
  final parameters = {'user_id_input': userId};

  // This line calls the Supabase function.
  final response = await SupaFlow.client.rpc(functionName, params: parameters);

  // This is for error handling, in case something goes wrong.
  if (response != null && response['error'] != null) {
    print(
        'Error calling check_and_award_badges: ${response['error']['message']}');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
