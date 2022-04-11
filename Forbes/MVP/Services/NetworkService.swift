//
//  NetworkService.swift
//  Forbes
//
//  Created by Мурад on 14.03.2022.
//

import Foundation
import Alamofire

class NetworkService {
    
    func loadData(completion: @escaping ([Person]) -> Void) {
        AF
            .request("http://app.cre.ru/api8/PlayersPersonList")
            .responseDecodable(of: Response.self) { response in
                
                switch response.result {
                case let .failure(error):
                    print(error.localizedDescription)
                case let .success(response):
                    completion(response.data)
                }
        }
        
    }
    
}
