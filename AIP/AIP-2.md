#AIP-2

Requires: AIP-0, AIP-1

Web of trust, an avatar conforming to this spec should have a property `"wot"` of which the value is the address of a WoT contracts ie:

    wot: "0xd9d3c812c9b508da606ff5b0945d9af5385d47e5"

WoT contract is linked list indexable by address containing a rating `int`.

A reference WoT contract is available at: [contracts/wot.sol](/contracts/wot.sol) the above example address is one such contract 

The owner of the avatar can add, remove, incrementRating, decrementRating for an arbitrary set of addresses, while these can be arbitrary eth accounts or contract addresses, it is assumed that in the basic case this will be the contact address of other avatars.

    contract WoT is owned, mortal, LinkedListAddressInt {
        // inherits all the methods and properties of a LinkedList( address => int )
        // where only constant methods and values are public.
        function up (address id) {...}
        function down (address id) {...}
        function set (address id, int value) {...}
    }
    

New ratings are added by calling wotUp or wotDown with a previously unrated address. Any rating which changes to 0 is removed to conserve space in the blockchain.

See reference implementation: [contracts/wot.sol](/contracts/wot.sol) The address used in the example above was created using that contract, and cost 0.04146240000000034 ether to deploy in block #155161 (Fri Aug 28 2015 05:08:35 GMT-0500 (CDT))
