//
//  CoinDetailsView.swift
//  Crypto Coin
//
//  Created by Kelvin on 6/17/24.
//

import SwiftUI

struct CoinDetailsView: View {
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        if let coin = viewModel.selectedCoin {
            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.largeTitle)
                
                Text("Current Price: \(String(format: "%.2f", coin.current_price))")
            }
        } else {
            Text("No coin selected.")
        }
    }
}

#Preview {
    CoinDetailsView()
        .environment(ViewModel())
}
