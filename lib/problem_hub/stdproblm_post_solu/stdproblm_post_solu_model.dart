import '/flutter_flow/flutter_flow_util.dart';
import 'stdproblm_post_solu_widget.dart' show StdproblmPostSoluWidget;
import 'package:flutter/material.dart';

class StdproblmPostSoluModel extends FlutterFlowModel<StdproblmPostSoluWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_solution = false;
  FFUploadedFile uploadedLocalFile_solution =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_solution = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
