#AIP-2

Requires: AIP-0, AIP-1

Web of trust, an avatar conforming to this spec should have a property `"wot"` of which the value is the address of a WoT contracts ie:

    wot: "0xMyWoTContractAddress"

WoT contract is linked list indexable by address containing a rating uint.

The owner of the avatar can add, remove, incrementRating, decrementRating for an arbitrary set of addresses, while these can be arbitrary eth accounts or contract addresses, it is assumed that in the basic case this will be the contact address of other avatars.

    contract WoT is owned, mortal, LinkedListAddressInt {
        // inherits all the methods and properties of a LinkedList( address => int )
        // where only constant methods and values are public.
        function up (address id) {...}
        function down (address id) {...}
        function set (address id, int value) {...}
    }
    

New ratings are added by calling wotUp or wotDown with a previously unrated address. Any rating which changes to 0 is removed to conserve space in the blockchain.
