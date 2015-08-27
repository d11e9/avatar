
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


contract LinkedListAddressInt is owned, mortal {
    
    struct Item {
        address prev;
        address next;
        int value;
    }
    
    address public head;
    address public tail;
    uint public length;
    mapping( address => Item) public items;
    
    
    modifier exist (address id, bool flag) { if ((items[id].value != 0 ) == flag) _ }
    
    function LinkedList(){
        tail = address(0);
        tail = address(0);
        length = 0;
    }
    function add (address addr, int value) exist(addr, false) onlyowner {
        address prev = head;
        items[prev].next = addr;
        items[addr] = Item( prev, address(0), value );
        head = addr;
        length++;
        
        if (tail == address(0)) { tail = addr; }
    }
    
    function remove(address addr) exist(addr, true) onlyowner {
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
