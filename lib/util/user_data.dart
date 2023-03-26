// Currency
int holoCoins = 0;
num onClickIncome = 1;
num passiveIncome = 0;

// Collection Array
// Purpose is to keep track of idols that you already have.
// Detect dupes by iterating over array to find existing
List<String> collection = [];

// Upgrades Map
// Keeps track of upgrades bought and their respective purchased tiers
// 0 == not purchased
final Map<String, int> ugprades = {"": 0};
