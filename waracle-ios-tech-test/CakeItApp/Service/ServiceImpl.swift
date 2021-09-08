//
//  ServiceImpl.swift
//  CakeItApp
//
//  Created by MAC on 08/09/21.
//

import Foundation


class ServiceImpl: Service {
  
    let urlSesson = URLSession(configuration: .default)
    var dataTask:URLSessionDataTask?
    func fetchData<T:Codable>(client:ServiceClient, type:T.Type, completionHandler:@escaping Completion<T>) {
        dataTask?.cancel()
        guard var urlComponents = URLComponents(string:client.baseUrl + client.path) else {
            completionHandler(.failure(.malformedURL(message:Constants.urlNotCorrect)))
            return
        }
        urlComponents.query = "\(client.params)"
        guard let url = urlComponents.url else {
            completionHandler(.failure(.malformedURL(message:Constants.urlNotCorrect)))
            return
        }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = client.method
                
        dataTask =  urlSesson.dataTask(with:urlRequest) { [weak self] (data, responce, error)  in
            guard  let _responce = responce as? HTTPURLResponse , _responce.statusCode == 200 else {
                completionHandler(.failure(.errorWith(message: Constants.noResponse)))
                return
            }
            guard let data = data else {
                completionHandler(.failure(.errorWith(message: Constants.noData)))
                return
            }
            // Parsing data using JsonDecoder
            if let result = self?.decode(input:data, type:type) {
                completionHandler(.success(result))
            }else {
                completionHandler(.failure(.parsinFailed(message:Constants.parsingFailed)))
            }
        }
        dataTask?.resume()
    }
}
