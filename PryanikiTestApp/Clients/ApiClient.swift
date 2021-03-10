//
//  ApiClient.swift
//  PryanikiTestApp
//
//  Created by A L E X on 3/4/21.
//

import Foundation

enum ApiError: Error {
    case noData
}
protocol ApiClient {
    func getData(completion: @escaping (Result<SampleResponse, Error>) -> ())
}

class ApiClientRequest: ApiClient {
    func getData(completion: @escaping (Result<SampleResponse, Error>) -> ()) {
        let session = URLSession.shared
        
        guard let url = URL(string: "https://pryaniky.com/static/json/sample.json") else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let dataTask   = session.dataTask(with: urlRequest, completionHandler: {data, response, error in
            
            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }
            
            do {
                let decoder  = JSONDecoder()
                let response = try decoder.decode(SampleResponse.self, from: data)
                completion(.success(response))
            } catch(let error) {
                print(error)
                completion(.failure(error))
            }
        })
        
        dataTask.resume()
    }
    
}
