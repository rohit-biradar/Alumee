import '/flutter_flow/flutter_flow_util.dart';
import 'std_problm_post_trial_widget.dart' show StdProblmPostTrialWidget;
import 'package:flutter/material.dart';

class StdProblmPostTrialModel
    extends FlutterFlowModel<StdProblmPostTrialWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading_problemPost = false;
  FFUploadedFile uploadedLocalFile_problemPost =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_problemPost = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
