#AIP-1

Web of trust, an avatar conforming to this spec should have a property "wot.version" with a value of 1 and a data structure at "wot" that is: a linked list indexable by avatar address containing a rating uint.

The owner of the avatar can add, remove, incrementRating, decrementRating for an arbitrary set of addresses, while these can be arbitrary eth accounts or contract addresses, it is assumed that in the basic case this will be the contact address of other avatars.

    struct WoTRating {
        address prev;
        uint value;
        address next;
    }

    struct WoT {
        address head;
        address tail;
        Mapping(address => WoTRating) ratings;
    }

    WoT wot = new  WoT();

    Function wotUp( address addr ) {}
    Function wotDown( address addr ) {}

New ratings are added by calling wotUp or wotDown with a previously unrated address. Any rating which changes to 0 is removed to conserve space in the blockchain.
