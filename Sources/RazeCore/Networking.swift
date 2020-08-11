//
//  Networking.swift
//  RazeCore
//
//  Created by yang wulong on 11/8/20.
//

import Foundation
extension RazeCore{
    public class Networking{
        ///Responsible for handling all networking calls
        /// warning:Must create before usiing any public APIS
        public class Manager{
            public init(){}
            private let session = URLSession.shared
            
            public func loadData(from url:URL,completionHandler: @escaping(NetworkResult<Data>) -> Void ){
                let task = session.dataTask(with: url){ data, response,error
                    in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
                task.resume()
            }
        }
        public enum NetworkResult<Value>{
            case success(Value)
            case failure(Error?)
        }
    }
}
