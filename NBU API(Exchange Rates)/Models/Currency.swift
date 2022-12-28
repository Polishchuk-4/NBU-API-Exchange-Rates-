//
//  Currency.swift
//  NBU API(Exchange Rates)
//
//  Created by Denys Polishchuk on 19.11.2022.
//

import Foundation

struct Сurrency: Codable {
    let r030: Int
    let txt: String
    let rate: Double
    let cc: String
}
