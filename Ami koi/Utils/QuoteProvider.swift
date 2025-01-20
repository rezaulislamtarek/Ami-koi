//
//  QuoteProvider.swift
//  Ami koi
//
//  Created by Rezaul Islam on 20/1/25.
//

import Foundation

class QuoteProvider {
    private var quotes: Quotes?
    
    init() {
        loadQuotes()
    }
    
    private func loadQuotes() {
        guard let url = Bundle.main.url(forResource: "quotes", withExtension: "json") else {
            print("Quotes JSON file not found.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            self.quotes = try decoder.decode(Quotes.self, from: data)
        } catch {
            print("Failed to load quotes: \(error.localizedDescription)")
        }
    }
    
    func getRandomQuote(for timeOfDay: TimeOfDayGreetings) -> String? {
        guard let quotes = quotes else { return nil }
        
        switch timeOfDay {
        case .morning:
            return quotes.morning.randomElement()
        case .noon:
            return quotes.noon.randomElement()
        case .afternoon:
            return quotes.afternoon.randomElement()
        case .evening:
            return quotes.evening.randomElement()
        case .night:
            return quotes.night.randomElement()
        }
    }
}
