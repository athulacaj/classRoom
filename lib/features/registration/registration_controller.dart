import 'package:flutter/foundation.dart';
import 'package:test_app/features/registration/model/registration_model.dart';
import 'package:test_app/features/registration/registration_repository.dart';

class RegistrationController with ChangeNotifier {
  RegistrationController({required this.registrationRepostitory});
  RegistrationRepostitory registrationRepostitory;

  final List<RegistrationModel> registrations = [];
}
