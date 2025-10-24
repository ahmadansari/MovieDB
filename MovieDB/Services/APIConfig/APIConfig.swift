//
//  File.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 06.09.23.
//

import Foundation

struct APIConfig: Decodable {
    let apiKey: String
    let baseURL: String
    let imagesPath: String
    let configPath: String

    private enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case baseURL = "base_url"
        case imagesPath = "images_path"
        case configPath = "config_path"
    }
}

extension APIConfig {
    static func load() -> APIConfig {
        guard let configFileURL = Bundle.main.url(forResource: "config", withExtension: "json") else {
            fatalError("Error loading configuration")
        }

        do {
            let data = try Data(contentsOf: configFileURL)
            let decoder = JSONDecoder()
            let config = try decoder.decode(APIConfig.self, from: data)
            return config
        } catch {
            fatalError("Error loading configuration: \(error)")
        }
    }
}
