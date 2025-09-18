# 🎁 Aptos Wishlist Smart Contract

A decentralized wishlist smart contract built on the Aptos blockchain that allows users to create wishlists and receive cryptocurrency contributions from friends, family, and community members.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Smart Contract Functions](#smart-contract-functions)
- [Installation & Setup](#installation--setup)
- [Usage Examples](#usage-examples)
- [Contract Structure](#contract-structure)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## 🌟 Overview

The Aptos Wishlist Smart Contract enables a new way of gift-giving and community support through blockchain technology. Users can create transparent wishlists where others can contribute AptosCoin towards specific items, making gift funding more accessible and transparent.

## ✨ Features

- **🎯 Targeted Funding**: Create wishlist items with specific names and prices
- **💰 Direct Contributions**: Contributors send tokens directly to wishlist owners
- **📊 Real-time Tracking**: Monitor funding progress for each item
- **✅ Auto-completion**: Items automatically marked as completed when fully funded
- **🔒 Secure Transfers**: Built on Aptos's secure Move language
- **⚡ Gas Efficient**: Minimal smart contract with only essential functions

## 🔧 Smart Contract Functions

### 1. `create_wishlist`
Creates a new wishlist for a user with an initial item.

**Parameters:**
- `owner: &signer` - The wishlist owner
- `item_name: vector<u8>` - Name of the wishlist item (UTF-8 encoded)
- `item_price: u64` - Target price in AptosCoin

### 2. `contribute_to_item`
Allows others to contribute tokens towards a specific wishlist item.

**Parameters:**
- `contributor: &signer` - The person making the contribution
- `wishlist_owner: address` - Address of the wishlist owner
- `item_index: u64` - Index of the item in the wishlist (starts from 0)
- `amount: u64` - Amount of AptosCoin to contribute

## 🚀 Installation & Setup

### Prerequisites
- [Aptos CLI](https://aptos.dev/tools/aptos-cli-tool/install-aptos-cli/)
- [Move language support](https://aptos.dev/guides/move-guides/move-on-aptos/)

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/Aptos-Wishlist-Contract.git
cd Aptos-Wishlist-Contract
```

### 2. Initialize Aptos Project
```bash
aptos init
```

### 3. Compile the Contract
```bash
aptos move compile
```

### 4. Deploy to Testnet
```bash
aptos move publish --named-addresses MyModule=YOUR_ADDRESS
```

## 💡 Usage Examples

### Creating a Wishlist
```move
// Create a wishlist with a "Gaming Laptop" item priced at 1000 AptosCoin
create_wishlist(owner_signer, b"Gaming Laptop", 1000);
```

### Contributing to an Item
```move
// Contribute 250 AptosCoin to the first item (index 0) in someone's wishlist
contribute_to_item(contributor_signer, wishlist_owner_address, 0, 250);
```

## 📊 Contract Structure

```move
struct WishlistItem {
    name: String,           // Item name
    price: u64,            // Target price
    funded_amount: u64,    // Current funding
    is_completed: bool,    // Completion status
}

struct Wishlist {
    items: vector<WishlistItem>,  // All wishlist items
    total_received: u64,          // Total contributions received
}
```

## 🧪 Testing

### Run Tests
```bash
aptos move test
```

### Manual Testing on Testnet
1. Deploy the contract to testnet
2. Create a test wishlist with sample item
3. Use a different account to contribute to the item
4. Verify the funding updates correctly

## 🛠️ Use Cases

- **🎁 Personal Gifts**: Friends contributing to birthday/holiday wishlists
- **🎮 Content Creators**: Streamers receiving equipment funding from viewers
- **🏫 Educational**: Students getting textbook/course funding from supporters
- **💼 Professional**: Entrepreneurs crowdfunding business equipment
- **❤️ Charity**: Organizations receiving donations for specific needs

## 🔮 Future Enhancements

- [ ] Multiple item addition after wishlist creation
- [ ] Item categories and tags
- [ ] Time-limited funding goals
- [ ] Partial refunds for over-funding
- [ ] Integration with frontend dApp
- [ ] NFT rewards for contributors
- [ ] Multi-token support beyond AptosCoin

## 🤝 Contributing

We welcome contributions! Please see our contributing guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [Aptos Documentation](https://aptos.dev/)
- [Move Language Guide](https://move-language.github.io/move/)
- [Aptos CLI Reference](https://aptos.dev/tools/aptos-cli-tool/use-aptos-cli/)

## 📞 Support

If you have questions or need help:
- Open an [issue](https://github.com/yourusername/Aptos-Wishlist-Contract/issues)
- Join our [Discord community](#)
- Follow us on [Twitter](#)

---

**Made with ❤️ for the Aptos ecosystem**
