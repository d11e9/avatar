contract WoT is LinkedListAddressInt {

    function up (address id) onlyowner {
      items[id].value++;
    }
    function down (address id) onlyowner{
      items[id].value--;
    }
    function set (address id, int value) onlyowner {
      items[id].value = value;
    }

}
