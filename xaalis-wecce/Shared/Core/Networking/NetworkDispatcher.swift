//
  //  NetworkDispatcher.swift
  //  xaalis-wecce (iOS)
  //
  //  Created by Mouhamed Dieye on 30/06/2021.
  //

import Foundation
import Combine

enum NetworkRequestError: LocalizedError, Equatable {
  case invalidRequest
  case badRequest
  case unauthorized
  case forbidden
  case notFound
  case error4xx(_ code: Int)
  case serverError
  case error5xx(_ code: Int)
  case decodingError
  case urlSessionFailed(_ error: URLError)
  case unknownError
}

struct NetworkDispatcher {
  let urlSession: URLSession!
  public init(urlSession: URLSession = .shared) {
    self.urlSession = urlSession
  }
    /// Dispatches an URLRequest and returns a publisher
    /// - Parameter request: URLRequest
    /// - Returns: A publisher with the provided decoded data or an error
  func  dispatch<ReturnType: Decodable>(request: URLRequest) -> AnyPublisher<ReturnType, NetworkRequestError> {
      // 1
    let decoder = JSONDecoder()
      //        decoder.keyDecodingStrategy = .convertFromSnakeCase
      // 2
    return  URLSession.shared
      .dataTaskPublisher(for: request)
      // 3
      .receive(on: DispatchQueue.main)
      // 4
      .mapError { _ in .unknownError }
      // 5
      .flatMap { data, response -> AnyPublisher<ReturnType, NetworkRequestError> in
        do {
          _ =  try decoder.decode(ReturnType.self, from: data)
            //                            return loaded
        } catch DecodingError.dataCorrupted(let context) {
          print(context)
        } catch DecodingError.keyNotFound(let key, let context) {
          print("Key '\(key)' not found:", context.debugDescription)
          print("codingPath:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
          print("Value '\(value)' not found:", context.debugDescription)
          print("codingPath:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
          print("Type '\(type)' mismatch:", context.debugDescription)
          print("codingPath:", context.codingPath)
        } catch let error {
          print("error: ", error)
        }
        if let response = response as? HTTPURLResponse {
          if (200...299).contains(response.statusCode) {
              // 6
            return Just(data)
              .decode(type: ReturnType.self, decoder: decoder)
              .mapError {_ in .decodingError}
              .eraseToAnyPublisher()
          } else {
              // 7
            return Fail(error: .unknownError)
              .eraseToAnyPublisher()
          }
        }
        return Fail(error: NetworkRequestError.unknownError)
          .eraseToAnyPublisher()
      }
      .eraseToAnyPublisher()
  }
}

extension NetworkDispatcher {
    /// Parses a HTTP StatusCode and returns a proper error
    /// - Parameter statusCode: HTTP status code
    /// - Returns: Mapped Error
  private func httpError(_ statusCode: Int) -> NetworkRequestError {
    switch statusCode {
    case 400: return .badRequest
    case 401: return .unauthorized
    case 403: return .forbidden
    case 404: return .notFound
    case 402, 405...499: return .error4xx(statusCode)
    case 500: return .serverError
    case 501...599: return .error5xx(statusCode)
    default: return .unknownError
    }
  }
    /// Parses URLSession Publisher errors and return proper ones
    /// - Parameter error: URLSession publisher error
    /// - Returns: Readable NetworkRequestError
  private func handleError(_ error: Error) -> NetworkRequestError {
    switch error {
    case is Swift.DecodingError:
      return .decodingError
    case let urlError as URLError:
      return .urlSessionFailed(urlError)
    case let error as NetworkRequestError:
      return error
    default:
      return .unknownError
    }
  }
}
