//
//  Constant.swift
//  NewsAssignment
//
//  Created by Abhishek Kumar on 12/11/20.
//

import Foundation

let mostPopularkey = "aBiEVEKW9XTb9ofEEpJRAf57XIZiGQz5"
let baseURL = "https://api.nytimes.com/svc/mostpopular"
let endpoint = "/v2/viewed/1.json"
let urlMostPopularView = baseURL + endpoint + "?api-key=\(mostPopularkey)"
