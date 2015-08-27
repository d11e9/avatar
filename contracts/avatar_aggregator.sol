contract AvatarAggregator is LinkedListAddressAddress {
    
    address[] public avatars;
    
    function create () returns( address contractAddress ) {
        Avatar avatar = new Avatar();
        avatar.transfer( msg.sender );
        avatars.length++;
        avatars[avatars.length] = address(avatar);
        return address(avatar);
    }
    
    function register () returns (bool success) {
      
    } 
}
