//
//  main.swift
//  framer
//
//  Created by Larry Edelstein on 2/25/23.
//

import Foundation
import AVFoundation

print("Hello, World!")
print(CommandLine.arguments.count)

let filename = CommandLine.arguments[1]
let url = NSURL.fileURL(withPath: filename)
let asset = AVAsset(url: url)
let generator = AVAssetImageGenerator.init(asset: asset)
let cgImage = try! generator.copyCGImage(at: CMTime(seconds: 23, preferredTimescale: 1), actualTime: nil)

let destinationURL = NSURL.fileURL(withPath: "/Users/larry.edelstein/Desktop/football.png")
if let destination = CGImageDestinationCreateWithURL(destinationURL as CFURL, kUTTypePNG, 1, nil) {
    CGImageDestinationAddImage(destination, cgImage, nil)
    let success = CGImageDestinationFinalize(destination)
    print(success)
} else {
    print("failed image destination create")
}

