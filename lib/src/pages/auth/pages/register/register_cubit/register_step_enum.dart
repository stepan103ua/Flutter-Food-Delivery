enum RegisterStep {
  info,
  city,
  password,
}

extension RegisterStepEnumMapper on RegisterStep {
  int get page {
    switch (this) {
      case RegisterStep.info:
        return 1;
      case RegisterStep.city:
        return 2;
      case RegisterStep.password:
        return 3;
    }
  }
}
