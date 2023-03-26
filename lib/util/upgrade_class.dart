import "./user_data.dart";

class Upgrade {
  String name;
  String desc;
  int tier;

  String get upgradeName {
    return name;
  }

  String get upgradeDesc {
    return desc;
  }

  int get upgradeTier {
    return tier;
  }

  Upgrade(this.name, this.desc, this.tier);
}

class Passive extends Upgrade {
  num increase;

  // function that increases passive income
  void intIncrease(increase) {
    passiveIncome += increase;
  }

  // make sure percent value is 1.X instead of 0.X
  void percentIncrease(increase) {
    passiveIncome += (increase * passiveIncome).ceil();
  }

  Passive(super.name, super.desc, super.tier, this.increase);
}

class Active extends Upgrade {
  num increase;

  // function that increases on-click value
  void intIncrease(increase) {
    onClickIncome += increase;
  }

  // make sure percent value is 1.X instead of 0.X
  void percentIncrease(increase) {
    onClickIncome += (increase * passiveIncome).ceil();
  }

  Active(super.name, super.desc, super.tier, this.increase);
}
