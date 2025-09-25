import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'user';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get educationBackground => getField<String>('education_background');
  set educationBackground(String? value) =>
      setField<String>('education_background', value);

  int? get graduationYear => getField<int>('graduation_year');
  set graduationYear(int? value) => setField<int>('graduation_year', value);

  String? get company => getField<String>('company');
  set company(String? value) => setField<String>('company', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  bool? get isMentor => getField<bool>('is_mentor');
  set isMentor(bool? value) => setField<bool>('is_mentor', value);

  List<String> get mentorExpertise => getListField<String>('mentor_expertise');
  set mentorExpertise(List<String>? value) =>
      setListField<String>('mentor_expertise', value);

  String? get profilePictureUrl => getField<String>('profile_picture_url');
  set profilePictureUrl(String? value) =>
      setField<String>('profile_picture_url', value);

  String? get backgroundPictureUrl =>
      getField<String>('background_picture_url');
  set backgroundPictureUrl(String? value) =>
      setField<String>('background_picture_url', value);

  bool? get isApproved => getField<bool>('is_approved');
  set isApproved(bool? value) => setField<bool>('is_approved', value);

  int? get mentorshipsCompleted => getField<int>('mentorships_completed');
  set mentorshipsCompleted(int? value) =>
      setField<int>('mentorships_completed', value);

  int? get problemsSolved => getField<int>('problems_solved');
  set problemsSolved(int? value) => setField<int>('problems_solved', value);
}
