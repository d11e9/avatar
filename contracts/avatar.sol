
contract owned {
    address owner;
    function owned() { owner = msg.sender; }
    function transfer(address to) returns (bool success){
        if (isOwner()) {
            owner = to;
            return true;
        } else {
            return false;
        }
    }
    function isOwner () returns(bool) {
        return msg.sender == owner;
    }
    
    function isOwner (address addr) returns(bool) {
        return addr == owner;
    }
    
    modifier onlyowner { if (msg.sender == owner) _ }
}

contract mortal is owned {
    function kill() onlyowner { suicide(owner); }
}

contract wot is owned, mortal {
    struct Rating {
        int value;
        address prev;
        address next;
    }
    
    struct WoT {
        address head;
        address tail;
        mapping (address => Rating) ratings;
    }
    
    WoT public wot;

    function getRating( address id) constant returns (int rating) {
        return wot.ratings[id].value;
    }
    
    function wotUp(address id) onlyowner returns (int) {
        if (wot.ratings[id].value != 0) {
            wot.ratings[id].value++;
        } else {
            wot.ratings[id] = Rating( 1, wot.head, address(0));
            wot.head = id;
        }
        return wot.ratings[id].value;
    }
    function wotDown (address id) onlyowner returns (int) {
        if (wot.ratings[id].value != 0) {
            wot.ratings[id].value--;
        } else {
            wot.ratings[id] = Rating( -1, wot.head, address(0));
            wot.head = id;
        }
        return wot.ratings[id].value;
    }
}

contract sender is owned {
    function send(address to, uint value) onlyowner returns (bool success) {
        if (address(this).balance >= value) {
            to.send( value );
            return true;
        } else {
            return false;
        }
    }
}

contract keyvalue is owned {
    mapping (bytes32 => string) public keys;
    function set(bytes32 key, string value) onlyowner {
        keys[key] = value;
    }
}

contract Avatar is wot, sender, keyvalue { }

contract AvatarFactory {
    
    address[] public avatars;
    
    function create () returns( address contractAddress ) {
        Avatar avatar = new Avatar();
        avatar.transfer( msg.sender );
        avatars.length++;
        avatars[avatars.length] = address(avatar);
        return address(avatar);
    }
}
