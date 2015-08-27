#Avatar

Ethereum contract that merges the functionality of keybase and gravatar.

The root contract  (aggregator) only stores reference to individual avatar contracts, owned by their creators. Individual avatars are free to register with an arbitrary set of aggregators.

An avatar contract at its base is a store of arbitrary structured data that conforms to an existing AIP (Avatar Improvement Proposal).

All data is arbitrary and creator controlled, but conventions allow for the data to be verified out with of the blockchain.

The first spec: 

#AIP-0
Specifies an avatar should be under the full control of its creator, and have any of the following editable properties, publicly readable.

    name:
    img:
    img.proof:

    url:
    url.proof:

    eth:
    eth.proof:

    btc:
    btc.proof:

    pgp:
    pgp.proof:

## Property values

In the most basic case, property values are limited to byte32 strings, which could contain the content itself 

In cases where the content is too long it would contain a reference to it, in the form or URI (legacy) or contentHash (recommended).

As we transition from the legacy web of URLs pointing to centralised servers, it is expected that values could be URLs but a verifier should be aware of the shortcomings of this mechanism.

While as the ecosystem evolves and develops we see the need to support newer, decentralised solutions.

The first of which is ipfsContentHash, but we would expect that other formats will be used/added in the future and included in appropriate AIPs.

##Proofs

Specified as "<property>.proof" are considered to be an acceptable mechanism which proves the validity and control over the value of "<property>", the contract does not itself prove the validity, the responsibility is deferred to the inquirer.

How does this work in practice, some examples:

Where pgp: my_public_key, we can provide a message who's body is the address of my avatar signed with the key provided.

Simple enough in the context of public-private key systems.

What about the img.proof property, this is whew convention and the lack of specificity in the avatar spec shows its adaptability.

We might have an avatar contract that specifies a cool batman image contentHash or url. Which is all well and good, but if someone wanted to visually confirm my identity I can provide a contentHash of a passport photo that someone could compare to me in person to verify I am who I say I am.


#AIP-1

Web of trust, an avatar conforming to this spec should have a property "wot.version" with a value of 1 and a data structure at "wot" that is: a linked list indexable by avatar address containing a rating uint.

The owner of the avatar can add, remove, incrementRating, decrementRating for an arbitrary set of addresses, while these can be arbitrary eth accounts or contract addresses, it is assumed that in the basic case this will be the contact address of other avatars.

    struct WoTRating {
        address prev;
        uint value;
        address next;
    }

    struct WoT {
        address head;
        address tail;
        Mapping(address => WoTRating) ratings;
    }

    WoT wot = new  WoT();

    Function wotUp( address addr ) {}
    Function wotDown( address addr ) {}

New ratings are added by calling wotUp or wotDown with a previously unrated address. Any rating which changes to 0 is removed to conserve space in the blockchain.


  














