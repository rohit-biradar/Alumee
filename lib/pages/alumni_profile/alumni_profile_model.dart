import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'alumni_profile_widget.dart' show AlumniProfileWidget;
import 'package:flutter/material.dart';

class AlumniProfileModel extends FlutterFlowModel<AlumniProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatsRow>? chatQuery1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatsRow>? chatQuery2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatsRow? newChat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
