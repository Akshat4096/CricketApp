class AppValidations {
  /// Validates if the field is not empty
  static String? validateRequired(String? value,
      {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  /// Validates if the value is a valid email address
  static String? validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);
    if (value == null || value.trim().isEmpty) {
      return 'Email is required.';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  /// Validates if the value is a valid phone number
  static String? validatePhoneNumber(String? value) {
    const phonePattern = r'^\+?[0-9]{7,15}$';
    final regex = RegExp(phonePattern);
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required.';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid phone number.';
    }
    return null;
  }

  /// Validates if the password meets the required criteria
  /// At least one uppercase, one lowercase, one number, one special character, and 6 characters long
  static String? validatePassword(String? value) {
    const passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{6,}$';
    final regex = RegExp(passwordPattern);
    if (value == null || value.trim().isEmpty) {
      return 'Password is required.';
    } else if (!regex.hasMatch(value)) {
      return 'Password must have an uppercase, number, special char, and be 6+ characters.';
    }
    return null;
  }

  /// Validates if the username meets the required criteria
  /// Allows alphanumeric and underscores, 3-20 characters long
  static String? validateUsername(String? value) {
    const usernamePattern = r'^[a-zA-Z0-9_]{3,20}$';
    final regex = RegExp(usernamePattern);
    if (value == null || value.trim().isEmpty) {
      return 'Username is required.';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Username can only contain letters, numbers, and underscores, and must be 3-20 characters long.';
    }
    return null;
  }

  /// Validates if the value is a valid date
  /// Expects a date in the format 'yyyy-MM-dd'
  static String? validateDate(String? value) {
    const datePattern = r'^\d{4}-\d{2}-\d{2}$';
    final regex = RegExp(datePattern);
    if (value == null || value.trim().isEmpty) {
      return 'Date is required.';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid date in the format YYYY-MM-DD.';
    }
    return null;
  }

  /// Validates if the value is a number within a specific range
  static String? validateNumber(String? value, {int? min, int? max}) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required.';
    }
    final number = int.tryParse(value.trim());
    if (number == null) {
      return 'Please enter a valid number.';
    }
    if (min != null && number < min) {
      return 'Value must be at least $min.';
    }
    if (max != null && number > max) {
      return 'Value must be less than or equal to $max.';
    }
    return null;
  }

  /// Validates if the URL is valid
  static String? validateUrl(String? value) {
    const urlPattern =
        r'^(https?:\/\/)?([a-zA-Z0-9.-]+)(\.[a-zA-Z]{2,})(\/\S*)?$';
    final regex = RegExp(urlPattern);
    if (value == null || value.trim().isEmpty) {
      return 'URL is required.';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid URL.';
    }
    return null;
  }

  /// Validates if the age is greater than or equal to 18
  static String? validateAge(String? value) {
    final age = int.tryParse(value ?? '');
    if (value == null || value.trim().isEmpty) {
      return 'Age is required.';
    } else if (age == null || age < 18) {
      return 'You must be at least 18 years old.';
    }
    return null;
  }

  /// Validates if the two fields (e.g., password and confirm password) match
  static String? validateConfirmPassword(
      String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please enter confirm password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter OTP';
    } else if (value.length != 6) {
      return 'OTP must be exactly 6 digits';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'OTP should contain only digits';
    }
    return null;
  }

  static String? validateName(String? value) {
    // Regex pattern to validate names
    const namePattern = r"^[a-zA-Zà-ÿÀ-Ÿ'’-]{2,50}( [a-zA-Zà-ÿÀ-Ÿ'’-]{2,50})*$";
    final regex = RegExp(namePattern);

    if (value == null || value.trim().isEmpty) {
      return 'Name is required.';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid name.';
    }
    return null;
  }
}
