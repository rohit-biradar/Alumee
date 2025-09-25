import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_chat_bot_copy_widget.dart' show AIChatBotCopyWidget;
import 'package:flutter/material.dart';

class AIChatBotCopyModel extends FlutterFlowModel<AIChatBotCopyWidget> {
  ///  Local state fields for this component.

  List<ChatMessageStruct> chatHistory = [];
  void addToChatHistory(ChatMessageStruct item) => chatHistory.add(item);
  void removeFromChatHistory(ChatMessageStruct item) =>
      chatHistory.remove(item);
  void removeAtIndexFromChatHistory(int index) => chatHistory.removeAt(index);
  void insertAtIndexInChatHistory(int index, ChatMessageStruct item) =>
      chatHistory.insert(index, item);
  void updateChatHistoryAtIndex(
          int index, Function(ChatMessageStruct) updateFn) =>
      chatHistory[index] = updateFn(chatHistory[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (askOpenAI)] action in IconButton widget.
  ApiCallResponse? aiResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
