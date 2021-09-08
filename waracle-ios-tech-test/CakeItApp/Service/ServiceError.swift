//
//  ServiceError.swift
//  CakeItApp
//
//  Created by MAC on 08/09/21.
//

import Foundation

enum ServiceError: Error {
    case parsinFailed(message:String)
    case errorWith(message:String)
    case networkNotAvailalbe
    case malformedURL(message:String)
}
