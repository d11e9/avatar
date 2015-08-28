contract owned {
    address owner;
    function owned() { owner = msg.sender; }
    function transfer(address to) onlyowner returns (bool success){
        owner = to;
        return true;
    }
    
    modifier onlyowner { if (msg.sender == owner) _ }
}

contract mortal is owned {
    function kill() onlyowner returns (bool){
        suicide(owner);
        return true;
    }
}

contract keyvalue is owned, mortal {
    mapping (bytes32 => bytes32) keys;
    
    function get(bytes32 key) constant returns (bytes32) {
        return keys[key];
    }
    function set(bytes32 key, bytes32 value) onlyowner returns(bytes32) {
        keys[key] = value;
        return keys[key];
    }
    
    function set(bytes32 key, address val) onlyowner returns(bytes32) {
        return set( key, bytes32(val) );
    }
}
contract LinkedListAddressInt is owned, mortal {
    
    struct Item {
        bool exists;
        address prev;
        address next;
        int value;
    }
    
    address head;
    address tail;
    uint length;
    mapping( address => Item) items;
    
    function getHead () constant returns (address) { return head; }
    function getTail () constant returns (address) { return tail; }
    function getLength () constant returns (uint) { return length; }
    function getItem(address id) constant returns(int) { return items[id].value; }
    function getItemNext(address id) constant returns(address) { return items[id].next; }
    function getItemPrev(address id) constant returns(address) { return items[id].prev; }
    
    modifier exist (address id, bool flag) { if ((items[id].value != 0 ) == flag) _ }

    function add (address addr, int value) exist(addr, false) internal {
        address prev = head;
        items[prev].next = addr;
        items[addr] = Item( true, prev, address(0), value );
        head = addr;
        length++;
        
        if (tail == address(0)) { tail = addr; }
    }
    
    function remove(address addr) exist(addr, true) internal {
        if (head == addr) {
            head = items[addr].prev;
        }
        
        if (tail == addr) {
            tail = items[addr].next;
        }
        
        if (items[addr].prev != address(0)) {
            items[items[addr].prev].next = items[addr].next;
        }
        
        if (items[addr].next != address(0)) {
            items[items[addr].next].prev = items[addr].prev;
        }
        
        length--;
        
        delete items[addr];
        
    }
}


contract WoT is LinkedListAddressInt {

    function up (address id) onlyowner returns (int rating) {
      if (items[id].exists) {
          items[id].value++;
      } else {
          add( id, 1 );
      }
      return items[id].value;
    }
    function down (address id) onlyowner returns (int rating) {
      if (items[id].exists) {
          items[id].value--;
      } else {
          add( id, -1 );
      }
      return items[id].value;
    }
    function set (address id, int value) onlyowner returns (int rating) {
      if (items[id].exists) {
          items[id].value = value;
      } else {
          add( id, value );
      }
      return items[id].value;
    }

}


contract Avatar is keyvalue {
    function createWoT() onlyowner returns(address wotContractAddress) {
        WoT wot = new WoT();
        wot.transfer( msg.sender );
        set( "wot", address(wot) );
        return address(wot);
    }
}


contract LinkedListAddressAddress is owned, mortal {
    
    struct Item {
        bool exists;
        address prev;
        address next;
        address value;
    }
    
    address head;
    address  tail;
    uint length;
    mapping( address => Item) items;
    
    function getHead () constant returns (address) { return head; }
    function getTail () constant returns (address) { return tail; }
    function getLength () constant returns (uint) { return length; }
    function getItem(address id) constant returns(address[] item) {
        item[0] = items[id].prev;
        item[1] = items[id].next;
        item[2] = items[id].value;
        return item;
    }
    
    modifier exist (address id, bool flag) { if (items[id].exists == flag) _ }
    
    function add (address addr, address value) exist(addr, false) internal returns(address) {
        address prev = head;
        items[prev].next = addr;
        items[addr] = Item( true, prev, address(0), value );
        head = addr;
        length++;
        
        if (tail == address(0)) { tail = addr; }
        return addr;
    }
    
    function remove(address addr) exist(addr, true) internal returns(bool) {
        if (head == addr) {
            head = items[addr].prev;
        }
        
        if (tail == addr) {
            tail = items[addr].next;
        }
        
        if (items[addr].prev != address(0)) {
            items[items[addr].prev].next = items[addr].next;
        }
        
        if (items[addr].next != address(0)) {
            items[items[addr].next].prev = items[addr].prev;
        }
        
        length--;
        
        delete items[addr];
        return true;
    }
}


contract AvatarAggregator is LinkedListAddressAddress {
    
    function createAvatar () returns(address contractAddress) {
        Avatar avatar = new Avatar();
        avatar.transfer( msg.sender );
        return add( msg.sender, address(avatar) );
    }
    
    function register (address avatar) returns (address contractAddress) {
        return add( msg.sender, address(avatar) );
    }

    function deregister () returns (bool success){
        return remove( msg.sender );
    }
}
