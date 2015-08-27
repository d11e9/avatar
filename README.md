#Avatar

Ethereum contract that merges the functionality of [keybase.io](https://keybase.io) and [Gravatar](https://en.wikipedia.org/wiki/Gravatar) in an open and decentralised manner.

An avatar contract at its base is a store of arbitrary structured data that conforms to an existing AIP. All data is arbitrary and creator controlled, but conventions allow for the data to be verified out with of the blockchain. These conventions are proposed and discussed in public as AIP.

##Avatar Improvement Proposals

Avatar Improvement Proposals (AIP) are specified in order to standardize and improve avatars in a way that allows freedom of choice, interoperability and fosters discussion. The first of which (AIP-0)defines the basic operations of an Avatar.

* [AIP-0](/AIP/AIP-0.md) Genisis
* [AIP-1](/AIP/AIP-1.md) Web of Trust

##Aggregators

Aggregators are registry contracts that store reference to individual avatar contracts, owned by their creators. Individual avatars are free to register with an arbitrary set of aggregators.

The first such aggregator acts as an AvatarFactory allowing users to either create their own Avatars or register existing avatars.
  














