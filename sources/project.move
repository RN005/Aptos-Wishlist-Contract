module MyModule::Wishlist {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use std::vector;
    use std::string::{Self, String};

    /// Struct representing a wishlist item
    struct WishlistItem has store, copy, drop {
        name: String,           // Name of the wished item
        price: u64,            // Price of the item in tokens
        funded_amount: u64,    // Amount already funded
        is_completed: bool,    // Whether the item is fully funded
    }

    /// Struct representing a user's wishlist
    struct Wishlist has store, key {
        items: vector<WishlistItem>,  // Vector of wishlist items
        total_received: u64,          // Total tokens received for all items
    }

    /// Function to create a new wishlist with an initial item
    public fun create_wishlist(
        owner: &signer, 
        item_name: vector<u8>, 
        item_price: u64
    ) {
        let first_item = WishlistItem {
            name: string::utf8(item_name),
            price: item_price,
            funded_amount: 0,
            is_completed: false,
        };

        let wishlist = Wishlist {
            items: vector::singleton(first_item),
            total_received: 0,
        };

        move_to(owner, wishlist);
    }

    /// Function for others to contribute tokens towards a specific wishlist item
    public fun contribute_to_item(
        contributor: &signer,
        wishlist_owner: address,
        item_index: u64,
        amount: u64
    ) acquires Wishlist {
        let wishlist = borrow_global_mut<Wishlist>(wishlist_owner);
        let item = vector::borrow_mut(&mut wishlist.items, item_index);

        // Transfer tokens from contributor to wishlist owner
        let contribution = coin::withdraw<AptosCoin>(contributor, amount);
        coin::deposit<AptosCoin>(wishlist_owner, contribution);

        // Update item funding
        item.funded_amount = item.funded_amount + amount;
        wishlist.total_received = wishlist.total_received + amount;

        // Mark as completed if fully funded
        if (item.funded_amount >= item.price) {
            item.is_completed = true;
        };
    }
}