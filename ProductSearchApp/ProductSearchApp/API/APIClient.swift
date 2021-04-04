//
//  APIClient.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import RxSwift

class APIClient {
    
    private let baseURL = URL(string: "https://api.mercadolibre.com/")!
    
    func send<T: Codable>(apiRequest: APIRequest) -> Single<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return
                }
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }.asSingle()
    }
}
