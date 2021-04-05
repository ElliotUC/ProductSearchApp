//
//  ImageDownloader.swift
//  ProductSearchApp
//
//  Created by Elliot on 03-04-21.
//

import Foundation
import UIKit

class ImageDownloader {
    private static var imageMap: [Int: URLSessionTask] = [Int: URLSessionTask]()
    
    static func downloadImage(from url: URL, into imageView: UIImageView) {
        
        if(imageMap.contains(where: { (key, value) ->  Bool in
            key == imageView.hash
        })) {
            imageMap[imageView.hash]?.cancel()
        }
        
        let downloadTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() {
                imageView.image = image
            }
        }
        
        imageMap[imageView.hash] = downloadTask
        
        downloadTask.resume()
    }
}
