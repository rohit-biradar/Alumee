import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_alumni_engagement_widget.dart' show AdminAlumniEngagementWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AdminAlumniEngagementModel
    extends FlutterFlowModel<AdminAlumniEngagementWidget> {
  ///  Local state fields for this page.

  AlumniProgramsRow? programToEdit;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  Completer<List<AlumniProgramsRow>>? requestCompleter;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked;
  bool isDataUploading_imageUrl = false;
  FFUploadedFile uploadedLocalFile_imageUrl =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_imageUrl = '';

  bool isDataUploading_alumniEventImg = false;
  FFUploadedFile uploadedLocalFile_alumniEventImg =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_alumniEventImg = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
