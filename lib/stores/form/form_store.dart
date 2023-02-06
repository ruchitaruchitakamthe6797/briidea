import 'package:app_briidea/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _FormStore() {
    //_setupMobileValidations();
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
     reaction((_) => userEmail, validateUserEmail),
      reaction((_) => mobile, validateMobile),
      reaction((_) => firstName, validateFirstName),
      reaction((_) => lastName, validateLastName),
      reaction((_) => city, validateCity),
      reaction((_) => userId, validateUserId),
      reaction((_) => amount, validateAmount),
      reaction((_) => confirmPassword, validateConfirmPassword)
    ];
  }


  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';

  @observable
  String userId = '';

  @observable
  String amount = '';

@observable
  dynamic minOrderValue = 0.0;

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  String mobile = '';

  @observable
  String city = '';

  @observable
  String confirmPassword = '';

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin && userEmail.isNotEmpty && mobile.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
      mobile.isNotEmpty&&mobile.length==10;

  @computed
  bool get canUpdateProfile =>
      !formErrorStore.hasErrorsInUpdateProfile &&
      firstName.isNotEmpty&&lastName.isNotEmpty&&userEmail.isNotEmpty;

  @computed
  bool get canUpdateMyProfile =>
      !formErrorStore.hasErrorsInUpdateMyProfile &&
          firstName.isNotEmpty&&lastName.isNotEmpty&&userEmail.isNotEmpty&&city.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !formErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userEmail = value;
  }

  @action
  void setAppUserId(String value) {
    userId = value;
  }

  @action
  void setAmount(String value) {
    amount = value;
  }

  @action
  void setMinOrderAmount(dynamic value) {
    minOrderValue = value;
  }

  @action
  void setEmail(String value) {
    userEmail = value;
  }

  @action
  void setCity(String value) {
    city = value;
  }

  @action
  void setMobile(String value) {
    mobile = value;
  }

  @action
  void setFirstName(String value) {
    firstName = value;
  }

  @action
  void setLastName(String value) {
    lastName = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      formErrorStore.userEmail = null;
    }
  }

  @action
  void validateUserId(String value) {
    if (value.isEmpty) {
      formErrorStore.userId = "User id can't be empty";
    } else if (value.length < 10) {
      formErrorStore.userId = 'Please enter a valid user id';
    } else {
      formErrorStore.userId = null;
    }
  }

  @action
  void validateAmount(String value) {
    if (value.isEmpty) {
      formErrorStore.amount = "Amount can't be empty";
    } else if (value=='0') {
      formErrorStore.amount = 'Please enter a valid amount';
    }else if (double.parse(value)<minOrderValue) {
      formErrorStore.amount = 'Order amount should be greater than minimum order amount';
    } else {
      formErrorStore.amount = null;
    }
  }

  /*@action
  void validateMobile(String value) {
    if (value.isEmpty) {
      formErrorStore.mobile = "Mobile can't be empty";
    } else if (value.length < 10) {
      formErrorStore.mobile = 'Please enter a valid Mobile Number';
    } else {
      formErrorStore.mobile = null;
    }
  }*/

  @action
  void validateMobile(String value) {
    if (value.isEmpty) {
      formErrorStore.mobile = "Mobile can't be empty";
    } else if (value.length < 10) {
      formErrorStore.mobile = 'Please enter a valid Mobile Number';
    } else {
      formErrorStore.mobile = null;
    }
  }

  @action
  void validateFirstName(String value) {
    if (value.isEmpty) {
      formErrorStore.firstName = "First Name can't be empty";
    } else if (!isAlpha(value)) {
      formErrorStore.firstName = 'Please enter a valid First Name';
    } else {
      formErrorStore.firstName = null;
    }
  }
@action
  void validateCity(String value) {
    if (value.isEmpty) {
      formErrorStore.city = "City can't be empty";
    } else if (!isAlpha(value)) {
      formErrorStore.city = 'Please enter a valid City';
    } else {
      formErrorStore.city = null;
    }
  }

  @action
  void validateLastName(String value) {
    if (value.isEmpty) {
      formErrorStore.lastName = "Last Name can't be empty";
    } else if (!isAlpha(value)) {
      formErrorStore.lastName = 'Please enter a valid Last Name';
    } else {
      formErrorStore.lastName = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != mobile) {
      formErrorStore.confirmPassword = "Password doesn't match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  @action
  Future register() async {
    loading = true;
  }

  @action
  Future login() async {
    loading = true;

    Future.delayed(Duration(milliseconds: 2000)).then((future) {
      loading = false;
      success = true;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  /*void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
  }*/

  /*void validateMobileNumber() {
    validateMobile(mobile);
  }*/
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? userEmail;

  @observable
  String? userId;

  @observable
  String? amount;

  @observable
  String? firstName;

  @observable
  String? lastName;

  @observable
  String? password;

  @observable
  String? mobile;

  @observable
  String? city;

  @observable
  String? confirmPassword;

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      mobile != null;

  @computed
  bool get hasErrorsInUpdateProfile =>
      firstName != null || lastName != null || userEmail != null;

  @computed
  bool get hasErrorsInUpdateMyProfile =>
      firstName != null || lastName != null || userEmail != null || city != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;
}
