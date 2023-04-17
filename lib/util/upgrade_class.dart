import "./user_data.dart";

class Upgrade {
  String name;
  String desc;
  String upgradedDesc;
  int cost;
  int tier;
  int maxTier;

  String get upgradeName {
    return name;
  }

  String get upgradeDesc {
    return desc;
  }

  String get newDesc {
    return upgradedDesc;
  }

  int get upgradeCost {
    return cost;
  }

  int get upgradeTier {
    return tier;
  }

  int get upgradeMaxTier {
    return maxTier;
  }

  void purchase() {
    holoCoins -= cost;
  }

  Upgrade(this.name, this.desc, this.upgradedDesc, this.tier, this.maxTier,
      this.cost);
}

class Passive extends Upgrade {
  num increase;
  final String type;

  // function that increases passive income [Lemuel Javier (101168735)]
  void intIncrease(increase) {
    passiveIncome += increase;
  }

  // make sure percent value is 1.X instead of 0.X [Lemuel Javier (101168735)]
  void percentIncrease(increase) {
    passiveIncome += (increase * passiveIncome).ceil();
  }

  Passive(super.name, super.desc, super.upgradedDesc, super.tier, super.maxTier,
      super.cost, this.increase,
      {this.type = "passive"});
}

class Active extends Upgrade {
  num increase;
  final String type;

  // function that increases on-click value [Lemuel Javier (101168735)]
  void intIncrease(increase) {
    onClickIncome += increase;
  }

  // make sure percent value is 1.X instead of 0.X [Lemuel Javier (101168735)]
  void percentIncrease(increase) {
    onClickIncome += (increase * passiveIncome).ceil();
  }

  Active(super.name, super.desc, super.upgradedDesc, super.tier, super.maxTier,
      super.cost, this.increase,
      {this.type = "active"});
}
