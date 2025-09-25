import '../database.dart';

class MentorshipRequestsTable extends SupabaseTable<MentorshipRequestsRow> {
  @override
  String get tableName => 'mentorship_requests';

  @override
  MentorshipRequestsRow createRow(Map<String, dynamic> data) =>
      MentorshipRequestsRow(data);
}

class MentorshipRequestsRow extends SupabaseDataRow {
  MentorshipRequestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MentorshipRequestsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get menteeId => getField<String>('mentee_id');
  set menteeId(String? value) => setField<String>('mentee_id', value);

  String? get mentorId => getField<String>('mentor_id');
  set mentorId(String? value) => setField<String>('mentor_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
