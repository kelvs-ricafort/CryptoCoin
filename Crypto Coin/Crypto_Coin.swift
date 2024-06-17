//
//  Crypto_Coin.swift
//  Crypto Coin
//
//  Created by Kelvin on 6/17/24.
//

import SwiftUI

@main
struct Crypto_Coin: App {
    
    @State var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
