import "./upgrade_class.dart";

// Upgrade Array
var upgradeArray = [channel, memberSubscription, advertisement];

// Passive Upgrades
var channel = Passive(
    "HoloChannel", // Name
    "Create a channel for your agency!\n[+1 HoloCoin/ second]", // Inital Description
    "Upgrade your channel!\n[+1 HoloCoin/second]", // Upgraded Description
    0, // Tier
    5, // Max Tier
    10, // Cost
    1 // Increase
    );

var memberSubscription = Passive(
    "Member Subscriptions", // Name
    "Enable Members to Subscribe! [1.25x HoloCoins/second]",
    "Add new tiers of subscriptions! [1.25x HoloCoins/second]",
    0, // Tier
    1, // Max Tier
    25, // Cost
    1.25 // Increase
    );

// Active Upgrades
var advertisement = Active(
    "Advertisements", // Name
    "Purchase advertisements to promote your idols! [+5 HoloCoins/click]",
    "Increase frequency of ads shown to viewers! [+5 HoloCoins/click]",
    0, // Tier
    3, // Max Tier
    50, // Cost
    5 // Increase
    );
