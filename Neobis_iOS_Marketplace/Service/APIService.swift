//
//  APIService.swift
//  Neobis_iOS_Marketplace
//
import Foundation

class APIService {
    
    let baseURL = "https://berlin-backender.org.kg/swagger/"
    
    func post<T: Codable>(endpoint: String, data: T, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do {
            let jsonData = try JSONEncoder().encode(data)
            request.httpBody = jsonData
        } catch {
            print("Error encoding data to JSON: \(error)")
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "POST - Invalid response"])
                completion(.failure(error))
                return
            }
            
            let statusCode = httpResponse.statusCode
            if 200...299 ~= statusCode {
                if let data = data {
                    completion(.success(data))
                } else {
                    let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "POST - Empty response data"])
                    completion(.failure(error))
                }
            } else {
                do {
                    if let responseData = data {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                        if let jsonDict = json as? [String: Any],
                           let errorMessage = jsonDict["message"] as? String {
                            let error = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                            completion(.failure(error))
                            return
                        }
                    }
                } catch let serializationError {
                    let error = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "POST - \(serializationError.localizedDescription)"])
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func get(endpoint: String, email: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type" )
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "GET - Invalid response"])
                    completion(.failure(error))
                    return
                }
                
                let statusCode = httpResponse.statusCode
                if 200...299 ~= statusCode {
                    if let data = data {
                        completion(.success(data))
                    } else {
                        let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "GET - Empty response data"])
                        completion(.failure(error))
                    }
                } else {
                    do {
                        if let responseData = data {
                            let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                            if let jsonDict = json as? [String: Any],
                               let errorMessage = jsonDict["message"] as? String {
                                let error = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                                completion(.failure(error))
                                return
                            }
                        }
                    } catch let serializationError {
                        let error = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "GET - \(serializationError.localizedDescription)"])
                        completion(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}
