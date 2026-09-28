# Election Smart Contract

A decentralized voting system written in Solidity. Candidates are registered on the blockchain, each eligible voter can cast one vote, and the results can be verified by anyone.

## Features

- Owner can register candidates
- Each address can vote only once
- Votes are recorded on-chain and cannot be altered
- Anyone can view candidates and vote counts
- Winner is determined from the vote tally
- Custom error handling for invalid actions (e.g. double voting)

## Tech Stack

- Solidity ^0.8.x
- Foundry (build, test, deploy)
- Remix IDE (optional, for quick testing)

## Project Structure

```
.
├── src/
│   └── election.sol      # Main election contract
├── test/                 # Foundry tests
├── foundry.toml
└── README.md
```

## How It Works

1. **Deploy:** the deployer becomes the owner/admin.
2. **Add candidates:** the owner registers each candidate.
3. **Vote:** each voter calls the vote function with a candidate's ID. The contract rejects a second vote from the same address.
4. **Results:** anyone can read the vote counts and the current winner.

## Main Functions

| Function | Description | Access |
|----------|-------------|--------|
| `addCandidate(string name)` | Registers a new candidate | Owner only |
| `vote(uint candidateId)` | Casts one vote for a candidate | Any address, once |
| `getCandidate(uint id)` | Returns a candidate's name and vote count | Public |
| `getWinner()` | Returns the candidate with the most votes | Public |

> Update the function names above to match your contract.

## Getting Started

### Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Git

### Installation

```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
forge install
```

### Build

```bash
forge build
```

### Test

```bash
forge test
```

### Deploy locally

```bash
anvil
forge create src/election.sol:Election --rpc-url http://127.0.0.1:8545 --private-key <YOUR_PRIVATE_KEY>
```

Never commit a real private key to GitHub.

## Using Remix Instead

1. Open [remix.ethereum.org](https://remix.ethereum.org).
2. Create `election.sol` and paste in the contract.
3. Compile with the Solidity compiler tab.
4. Deploy from the Deploy & Run tab and test the functions.

## Security Notes

- This is a learning project and has not been audited. Do not use it for real elections.
- Voter identity is not verified; one address equals one vote.

## License

MIT
