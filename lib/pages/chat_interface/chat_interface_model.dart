import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_interface_widget.dart' show ChatInterfaceWidget;
import 'package:flutter/material.dart';

class ChatInterfaceModel extends FlutterFlowModel<ChatInterfaceWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<MessagesRow>>? listViewSupabaseStream;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
