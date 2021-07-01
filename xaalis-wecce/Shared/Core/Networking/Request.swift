//
  //  Request.swift
  //  xaalis-wecce (iOS)
  //
  //  Created by Mouhamed Dieye on 30/06/2021.
  //

import Foundation
import Combine

public enum HTTPMethod: String {
  case get     = "GET"
  case post    = "POST"
  case put     = "PUT"
  case delete  = "DELETE"
}

public protocol Request {
  var path: String { get }
  var method: HTTPMethod { get }
  var contentType: String { get }
  var body: [String: Any]? { get }
  var parameters: [URLQueryItem]? { get }
  var headers: [String: String]? { get }
  associatedtype ReturnType: Decodable
}

extension Request {
    // Defaults
  var method: String { return HTTPMethod.get.rawValue }
  var contentType: String { return "application/json" }
  var queryParams: [String: String]? { return nil }
  var parameters: [URLQueryItem]! { return nil }
  var body: [String: Any]? { return nil }
  var headers: [String: String]? { return nil }
    /// Serializes an HTTP dictionary to a JSON Data Object
    /// - Parameter params: HTTP Parameters dictionary
    /// - Returns: Encoded JSON
  private func requestBodyFrom(params: [String: Any]?) -> Data? {
    guard let params = params else { return nil }
    guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
      return nil
    }
    return httpBody
  }
    /// Transforms a Request into a standard URL request
    /// - Parameter baseURL: API Base URL to be used
    /// - Returns: A ready to use URLRequest
  func asURLRequest(baseURL: String) -> URLRequest? {
    guard var urlComponents = URLComponents(string: baseURL) else { return nil }
    urlComponents.path = "\(urlComponents.path)\(path)"
    urlComponents.queryItems = parameters
    guard let finalURL = urlComponents.url else { return nil }
    var request = URLRequest(url: finalURL)
    request.httpMethod = method.rawValue
    request.httpBody = requestBodyFrom(params: body)
    request.allHTTPHeaderFields = headers
    return request
  }
}
