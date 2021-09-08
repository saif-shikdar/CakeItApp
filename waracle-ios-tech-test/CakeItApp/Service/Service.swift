//
//  Service.swift
//  CakeItApp
//
//  Created by MAC on 08/09/21.
//

import Foundation

typealias Completion<T:Decodable> =  ((Result<[T], ServiceError>) -> Void)

protocol Service:JsonDecodable {
    func fetchData<T:Codable>(client:ServiceClient, type:T.Type, completionHandler:@escaping Completion<T>)
}


