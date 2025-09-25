import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mentorship_program_widget.dart' show MentorshipProgramWidget;
import 'package:flutter/material.dart';

class MentorshipProgramModel extends FlutterFlowModel<MentorshipProgramWidget> {
  ///  Local state fields for this page.

  String? searchTerm;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
