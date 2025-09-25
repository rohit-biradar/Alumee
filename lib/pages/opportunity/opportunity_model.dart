import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'opportunity_widget.dart' show OpportunityWidget;
import 'package:flutter/material.dart';

class OpportunityModel extends FlutterFlowModel<OpportunityWidget> {
  ///  Local state fields for this page.

  String selectedType = 'Job';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatsRow>? chatQuery1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatsRow>? chatQuery2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatsRow? newChat;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatsRow>? chatQuery1Copy;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatsRow>? chatQuery2Copy;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatsRow? newChatCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
  }
}
