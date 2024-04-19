# YourContract.sol

This contract is an implementation of an ERC721 token with additional functionality for tracking "infections". 

## Contract Details

The contract `Infector` has the following state variables:

- `kudzoAddress`: The address of the Kudzo ERC721 token contract.
- `kudzo`: An instance of the Kudzo ERC721 token contract.
- `totalInfected`: A counter for the total number of "infections".
- `creatorAddress`: The address of the contract creator.

The contract emits an `Infection` event whenever a new "infection" occurs.

## Constructor

The constructor takes two parameters: `_kudzoAddress` and `_creatorAddress`. It initializes the `kudzoAddress`, `kudzo`, and `creatorAddress` state variables and sets `totalInfected` to 0.

## Functions

- `isInfected()`: Checks if the contract itself holds any Kudzo tokens. Returns true if it does, false otherwise.
- `selfInfect()`: Transfers a Kudzo token from the contract to the caller. The token ID is determined by a pseudo-random number generator. Emits an `Infection` event and increments `totalInfected`.
- `getTotalSelfInfected()`: Returns the total number of "infections".
- `pseudoRNG(uint modulo)`: A pseudo-random number generator. Takes a `modulo` parameter and returns a pseudo-random number between 1 and `modulo`.

## Security Considerations

This contract uses a pseudo-random number generator based on the current block number. This is not secure and can be manipulated by miners. It is recommended to use a secure source of randomness for any functionality that requires unpredictability.
