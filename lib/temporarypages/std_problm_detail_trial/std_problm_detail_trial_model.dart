import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'std_problm_detail_trial_widget.dart' show StdProblmDetailTrialWidget;
import 'package:flutter/material.dart';

class StdProblmDetailTrialModel
    extends FlutterFlowModel<StdProblmDetailTrialWidget> {
  ///  Local state fields for this page.

  List<PostSolutionsRow> solutionsList = [];
  void addToSolutionsList(PostSolutionsRow item) => solutionsList.add(item);
  void removeFromSolutionsList(PostSolutionsRow item) =>
      solutionsList.remove(item);
  void removeAtIndexFromSolutionsList(int index) =>
      solutionsList.removeAt(index);
  void insertAtIndexInSolutionsList(int index, PostSolutionsRow item) =>
      solutionsList.insert(index, item);
  void updateSolutionsListAtIndex(
          int index, Function(PostSolutionsRow) updateFn) =>
      solutionsList[index] = updateFn(solutionsList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in stdProblmDetailTrial widget.
  List<PostSolutionsRow>? fetchedSolutions;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
