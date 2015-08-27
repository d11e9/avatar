
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
}

contract mortal is owned {
    function kill() { if (isOwner()) suicide(owner); }
}

contract wot is owned, mortal {
    mapping (address => uint) public ratings;
    function rateIdentity( address id, uint rating) {
        if (isOwner()) ratings[id] = rating;
    }
}

contract sender is owned {
    function send(address to, uint value) returns (bool success) {
        if (isOwner() && address(this).balance >= value) {
            to.send( value );
            return true;
        } else {
            return false;
        }
    }
}

contract keyvalue is owned {
    mapping (bytes32 => string) public keys;
    function set(bytes32 key, string value) {
        if (isOwner()) keys[key] = value;
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
