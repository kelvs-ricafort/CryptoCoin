//
//  ContentView.swift
//  Crypto Coin
//
//  Created by Kelvin on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        @Bindable var model = viewModel
        VStack {
            List(model.coinList) { coin in
                Text(coin.name)
                    .onTapGesture {
                        model.selectedCoin = coin
                    }
            }
            .listStyle(.plain)
        }
        .padding()
        .onAppear {
            // Tell the ViewModel to fetch
            model.getCoins()
        }
        .sheet(item: $model.selectedCoin) { coin in
            CoinDetailsView()
        }
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
}
