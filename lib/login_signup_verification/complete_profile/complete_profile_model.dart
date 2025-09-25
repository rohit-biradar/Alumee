import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'complete_profile_widget.dart' show CompleteProfileWidget;
import 'package:flutter/material.dart';

class CompleteProfileModel extends FlutterFlowModel<CompleteProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode1;
  TextEditingController? phoneTextController1;
  String? Function(BuildContext, String?)? phoneTextController1Validator;
  // State field(s) for full_name widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode2;
  TextEditingController? phoneTextController2;
  String? Function(BuildContext, String?)? phoneTextController2Validator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode3;
  TextEditingController? phoneTextController3;
  String? Function(BuildContext, String?)? phoneTextController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneFocusNode1?.dispose();
    phoneTextController1?.dispose();

    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    phoneFocusNode2?.dispose();
    phoneTextController2?.dispose();

    phoneFocusNode3?.dispose();
    phoneTextController3?.dispose();
  }
}
