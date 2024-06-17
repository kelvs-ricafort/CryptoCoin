//
//  ViewModel.swift
//  Crypto Coin
//
//  Created by Kelvin on 6/17/24.
//

import Foundation
import SwiftUI

@Observable
class ViewModel {
    var coinList = [Coin]()
    var selectedCoin: Coin?
    
    var dataService = DataService()
    
    func getCoins() {
        Task {
            coinList = await DataService().getCoinsList()
        }
    }
}
