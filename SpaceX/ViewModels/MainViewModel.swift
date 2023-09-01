//
//  MainViewModel.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import Foundation

class MainViewModel: ObservableObject {

    func helloWorldPrint(){
        let yearInSeconds: Double = 31557600 //number of seconds per year
        let yearsRange = yearInSeconds * 3
        let now = Date().timeIntervalSince1970
        let upcomingMax = Date().addingTimeInterval(+yearsRange).timeIntervalSince1970
        let pastOldest = Date().addingTimeInterval(-yearsRange).timeIntervalSince1970
        let jsonBody = """
                {
                    "query": {
                    "$or": [
                      {
                        "upcoming": true,
                        "date_unix": {
                          "$gte": \(now),
                          "$lt": \(upcomingMax)
                        }
                      },
                      {
                        "success": true,
                        "date_unix": {
                          "$gte": \(pastOldest),
                          "$lt": \(now)
                        }
                      }
                    ]    },
                        "options": {
                            "pagination": false,
                            "populate": [
                                {
                                    "path": "rocket",
                                    "select": {
                                        "name": 1,
                                        "description": 1,
                                        "wikipedia": 1,
                                        "flickr_images" : 1
                                    }
                                }
                            ]
                        }
                    
                }
                """
        let requst = SX_Request(httpMethod: "POST", endpoint: .launches, 
        pathComponents: ["query"], httpBody: jsonBody)


        print(requst.url)

        SX_Service.shared.execute(requst, expecting: SX_Launch.self) {result in
            switch result {
            case .success:
                break
            case .failure(let error):
                print(String(describing: error))
                
            }
        }
    }
}
