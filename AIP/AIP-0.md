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

Specified as `"<property>.proof"` are considered to be an acceptable mechanism which proves the validity and control over the value of `"<property>"`, the contract does not itself prove the validity, the responsibility is deferred to the inquirer.

How does this work in practice, some examples:

Where `"pgp": "<my_public_key>"`, we can provide a message who's body is the address of my avatar signed with the key provided. An example:

    pgp: "QmPhV4DxmYHuGxh9zYcpjbaNZtty4GQdAAGrpjtSXYQUHz" // ipfsHash of public key
    pgp.proof: "QmaBKmscVZgZkS1UyKrwqwV9UjE4wQhbmPVJYmLpFYu1uD" //ipfsHash of signed proof

Simple enough in the context of public-private key systems.

What about the `"img.proof"` property, this is where convention and the lack of specificity in the avatar spec shows its adaptability.

We might have an avatar contract that specifies a cool batman image contentHash or url. Which is all well and good, but if someone wanted to visually confirm my identity I can provide a contentHash of a passport photo that someone could compare to me in person to verify I am who I say I am.

So I might have an avatar with the following properties:

    img: "QmdoV7jf12CRDXm1dMK9o3EmvAiu9P6X5PtWvPVz8vadDK" // casual profile image
    img.proof: "QmREEfyXLDU4Ubdpw22Wf4BH3Dcq3RzHfYf7exn19AUiRh" // identity proof
