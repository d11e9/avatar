
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


contract keyvalue is owned {
    mapping (bytes32 => string) public keys;
    function set(bytes32 key, string value) onlyowner {
        keys[key] = value;
    }
}

contract Avatar is keyvalue { }

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
