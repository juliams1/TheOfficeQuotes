//
//  QuotesModel.swift
//  TheOfficeQuotes
//
//  Created by User on 06/10/23.
//

//{"id":244,"character":"Dwight Schrute","quote":"Bears are more afraid of you than you are of them? You obviously aren’t scared enough."}

import Foundation



struct QuotesModel: Codable, Hashable {
    var id: Int
    var character: String
    var quote: String
}


