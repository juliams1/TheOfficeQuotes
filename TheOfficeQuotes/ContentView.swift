//
//  ContentView.swift
//  TheOfficeQuotes
//
//  Created by User on 06/10/23.
//

import SwiftUI

//https://officeapi.akashrajpurohit.com/quote/random

struct ContentView: View {
    @State var quotes = QuotesModel(id: 0, character: "", quote: "")
    
    var body: some View {
        NavigationView {
            List() {
                    VStack (alignment: .leading) {
                        Text(quotes.character)
                            .font(.headline)
                        Text(quotes.quote)
                            .font(.body)
                    }
                    .navigationTitle("Life Changing Quotes")
                    .task {
                        await fetchData()
                }
                
            }
        }
    }
    func fetchData() async {
        guard let url = URL(string: "https://officeapi.akashrajpurohit.com/quote/random") else {
            print ("Oh no!")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(QuotesModel.self, from: data) {
                quotes = decodedResponse
            }
        } catch {
            print("")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
