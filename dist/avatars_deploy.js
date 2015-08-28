
var AvatarAggregatorContract = web3.eth.contract([{"constant":true,"inputs":[],"name":"tail","outputs":[{"name":"","type":"address"}],"type":"function"},{"constant":false,"inputs":[{"name":"to","type":"address"}],"name":"transfer","outputs":[{"name":"success","type":"bool"}],"type":"function"},{"constant":true,"inputs":[],"name":"length","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":false,"inputs":[{"name":"addr","type":"address"}],"name":"isOwner","outputs":[{"name":"","type":"bool"}],"type":"function"},{"constant":false,"inputs":[],"name":"kill","outputs":[{"name":"","type":"bool"}],"type":"function"},{"constant":false,"inputs":[{"name":"avatar","type":"address"}],"name":"register","outputs":[{"name":"contractAddress","type":"address"}],"type":"function"},{"constant":false,"inputs":[],"name":"isOwner","outputs":[{"name":"","type":"bool"}],"type":"function"},{"constant":true,"inputs":[],"name":"head","outputs":[{"name":"","type":"address"}],"type":"function"},{"constant":false,"inputs":[],"name":"deregister","outputs":[{"name":"success","type":"bool"}],"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"items","outputs":[{"name":"exists","type":"bool"},{"name":"prev","type":"address"},{"name":"next","type":"address"},{"name":"value","type":"address"}],"type":"function"},{"constant":false,"inputs":[],"name":"create","outputs":[{"name":"contractAddress","type":"address"}],"type":"function"}]);
var avatarAggregatorContractBinary = '606060405260008054600160a060020a031916331790556108bc806100256000396000f3006060604052361561008d5760e060020a600035046313d8c840811461008f5780631a695230146100a15780631f7b6d32146100b15780632f54bf6e146100ba57806341c0e1b5146100d85780634420e486146101015780638f32d59b1461021b5780638f7dcfa314610236578063aff5edb114610248578063d321411c14610439578063efc81a8c14610478575b005b6104e8600254600160a060020a031681565b610505600435600061054861021f565b61050560035481565b610505600435600054600160a060020a03908116908216145b919050565b61050560008054600160a060020a03908116339091161415610233578054600160a060020a0316ff5b6104e8600435600061057533835b600160a060020a03821660009081526004602052604081205481908490829060ff1681141561058357604080822060018054600160a060020a0390811680865284862083018054600160a060020a03199081168d1790915585516080810187528481526020818101848152978201898152606083018e81528f87168b5260049092529151875498516101000260ff19999099161774ffffffffffffffffffffffffffffffffffffffff001916979097178655518585018054831690911790559451600294850180548716909117905582549094168a178255600380549092019091559054919450168114156102115760028054600160a060020a031916871790555b8593505050610586565b6105055b600054600160a060020a0390811633909116145b90565b6104e8600154600160a060020a031681565b610505600061057c33600160a060020a038116600090815260046020526040812054829060019060ff1681141561058d578054600160a060020a0390811690851614156102b35760408320548154600160a060020a031916610100909104600160a060020a03161781555b600254600160a060020a0390811690851614156102fd57600160a060020a0384811660009081526004602052604090206001015460028054600160a060020a031916919092161790555b600160a060020a03848116600090815260046020526040812054610100900490911614610360576040600081812060018181015491546101009004600160a060020a039081168452939092209091018054600160a060020a031916919092161790555b600160a060020a03848116600090815260046020526040812060010154909116146103cf576040600081812060018101549054600160a060020a03918216835292909120805474ffffffffffffffffffffffffffffffffffffffff001916610100938490049092169092021790555b50506003805460001901905550600160a060020a0381166000908152600460205260409020805474ffffffffffffffffffffffffffffffffffffffffff1916815560018181018054600160a060020a031990811690915560029290920180549092169091556100d3565b6105176004356004602052600090815260409020600181015481546002929092015460ff8316926101009004600160a060020a03908116928116911684565b6104e8600060006040516103278061059583399082f0905080600160a060020a0316631a695230336040518260e060020a0281526004018082600160a060020a031681526020019150506020604051808303816000876161da5a03f115610002575061056f91503390508261010f565b60408051600160a060020a03929092168252519081900360200190f35b60408051918252519081900360200190f35b60408051948552600160a060020a039384166020860152918316848301529091166060830152519081900360800190f35b15610567575060008054600160a060020a0319168217905560016100d3565b5060006100d3565b91505090565b90506100d3565b9050610233565b50505b5092915050565b50509190505600606060405260008054600160a060020a03191633179055610302806100256000396000f300606060405260e060020a60003504631a69523081146100475780632f54bf6e146100575780638f32d59b14610074578063b48000331461008e578063dde5b7a114610151575b005b6101be600435600061023e610078565b6101be600435600054600160a060020a038281169116145b919050565b6101be5b600054600160a060020a03908116339091161490565b60408051602060248035600481810135601f81018590048502860185019096528585526101d09590359460449490939290920191819084018382808284375094955050505050506040805160208101909152600080825254600160a060020a039081163390911614156102dc576000838152600160209081526040822084518154818355828552938390209193601f01839004820192909190860182156102e2579182015b828111156102e2578251826000505591602001919060010190610133565b60016020908152600435600090815260409081902080548251601f82018590048502810185019093528083526101d0938301828280156101b657820191906000526020600020905b81548152906001019060200180831161019957829003601f168201915b505050505081565b60408051918252519081900360200190f35b60405180806020018281038252838181518152602001915080519060200190808383829060006004602084601f0104600302600f01f150905090810190601f1680156102305780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b1561026a57506000805473ffffffffffffffffffffffffffffffffffffffff191682179055600161006f565b50600061006f565b505060008381526001602090815260409182902080548351601f820184900484028101840190945280845290918301828280156102d457820191906000526020600020905b8154815290600101906020018083116102b757829003601f168201915b505050505090505b92915050565b506102729291505b808211156102fe57600081556001016102ea565b509056';
var AvatarContract = web3.eth.contract([{"constant":false,"inputs":[{"name":"to","type":"address"}],"name":"transfer","outputs":[{"name":"success","type":"bool"}],"type":"function"},{"constant":false,"inputs":[{"name":"addr","type":"address"}],"name":"isOwner","outputs":[{"name":"","type":"bool"}],"type":"function"},{"constant":false,"inputs":[],"name":"isOwner","outputs":[{"name":"","type":"bool"}],"type":"function"},{"constant":false,"inputs":[{"name":"key","type":"bytes32"},{"name":"value","type":"string"}],"name":"set","outputs":[{"name":"","type":"string"}],"type":"function"},{"constant":true,"inputs":[{"name":"","type":"bytes32"}],"name":"keys","outputs":[{"name":"","type":"string"}],"type":"function"}]);

var avatars = AvatarAggregatorContract.new({
   from: web3.eth.accounts[0], 
   data: avatarAggregatorContractBinary, 
   gas: 1000000
}, function(e, contract){
   if (typeof contract.address != 'undefined') {
      console.log(e, contract);
      console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
   }
});