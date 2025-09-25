import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String getProfileId(
  UserRow? userProfile,
  String? currentUserId,
) {
// Use the passed parameter's ID if it exists,
  // otherwise use the logged-in user's ID string.
  return userProfile?.id ?? currentUserId ?? '';
}

String getOtherUserId(
  String participant1Id,
  String participant2Id,
  String currentUserId,
) {
  if (participant1Id == currentUserId) {
    return participant2Id;
  } else {
    return participant1Id;
  }
}

dynamic formatChatForOpenAI(List<ChatMessageStruct> chatHistory) {
// This function takes your app's chat history and converts it into the exact
  // format the OpenAI API needs, including the all-important system prompt.

  if (chatHistory == null || chatHistory.isEmpty) {
    return []; // Return an empty list if there's no history.
  }

  List<Map<String, dynamic>> formattedHistory = [];

  // STEP 1: ADD THE AI'S "BRAIN" (THE SYSTEM PROMPT)
  // This message is secretly added at the start of every conversation.
  // It tells the AI its name, personality, and what it's an expert on.
  formattedHistory.add({
    "role": "system",
    "content":
        "You are 'Alumee Assistant', the helpful AI guide for the Alumee alumni app. Your personality is friendly, clear, and direct. Your ONLY goal is to help users find features in the app. Follow these rules STRICTLY: 1. Keep all responses to a maximum of 2 sentences. 2. Do not use complex words. 3. Do not ask follow-up questions. 4. Directly state the feature that will help the user. --- App Features: Directories (for Students/Alumni), Mentorship Program, Opportunities (job board), Events, Time Capsule (save memories), Donations, Admin Analytics."
  });

  // STEP 2: ADD THE ACTUAL CONVERSATION HISTORY
  // This loop converts each message from your app's format to the API's format.
  for (var message in chatHistory) {
    // 'user' for messages from the person, 'assistant' for the AI's replies
    String role = (message.senderId != null && message.senderId != '')
        ? 'user'
        : 'assistant';
    formattedHistory.add({"role": role, "content": message.message});
  }

  // STEP 3: RETURN THE FINAL, PERFECTLY FORMATTED LIST
  return formattedHistory;
}

int incrementNumber(int currentValue) {
  /// This function simply adds 1 to the number it receives.
  return currentValue + 1;
}
