#AIP-2

Requires: AIP-0

Private properties, an avatar conforming to this spec allows key values to be encypted or hashed, overand above the default (defined in AIP-0) plain text. This allows property values to be revealed out of band but to be verifiable on chain.

    "username": "d11e9"
    "name": "Doug A."


    "username": "d11e9"
    "name": "0xfeaddeadbeef2015"
    "name.hashed": "true"
    "name.encrypted": "true"
