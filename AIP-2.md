#AIP-2


Requires: API-1

Web of trust, an avatar conforming to this spec should have a property "wot" with a value of the contract address of a wot contractwhich is a linked list indexable by address containing a rating int.

The owner of the wot contract can add, remove, incrementRating, decrementRating for an arbitrary set of addresses, while these can be arbitrary eth accounts or contract addresses, it is assumed that in the basic case this will be the contact address of other avatars.

    contract Wot is LinkedListAddressInt {
    
      // inherits basic methods of a LinkedList( address => int )
      // only constants and the following are public.
      function wotUp( address addr ) public returns(bool success) { ... }
      function wotDown( address addr ) public returns(bool success) { ... }
      
    }
    

New ratings are added by calling wotUp or wotDown with a previously unrated address. Any rating which changes to 0 is removed to conserve space in the blockchain.
