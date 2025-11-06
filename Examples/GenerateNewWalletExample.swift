//
//  GenerateNewWalletExample.swift
//  BitcoinKit
//
//  Created by Contributor on 2025-11-01.
//

import Foundation
import BitcoinKit

/// Simple example showing how to create a new HD wallet and print its first receiving address.
struct GenerateNewWalletExample {

    static func run() {
        // Generate a new random mnemonic phrase (BIP39)
        let mnemonic = Mnemonic.generate()
        print("Generated mnemonic:")
        print(mnemonic.joined(separator: " "))

        // Create seed from mnemonic
        let seed = Mnemonic.seed(mnemonic: mnemonic)
        let wallet = HDWallet(seed: seed, network: .mainnetBTC)

        // Derive the first external receiving address (m/44'/0'/0'/0/0)
        let privateKey = try! wallet.privateKey(index: 0, chain: .external)
        let publicKey = privateKey.publicKey()
        let address = publicKey.toLegacy()

        print("First receiving address:")
        print(address)
    }
}

// Run example
GenerateNewWalletExample.run()
