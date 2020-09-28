//
//  decode.swift
//  redditEntradas
//
//  Created by Joaquin Perez Nano on 26/09/2020.
//  Copyright © 2020 Joaquin Perez Nano. All rights reserved.
//

//import Foundation

struct decode: Decodable {
    
    let title: String
    let author_fullname: String
    let num_comments: Int
    let thumbnail: String
}
