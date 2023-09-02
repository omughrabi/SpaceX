//
//  LaunchesListViewModel.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import UIKit

final class LaunchesListViewModel: NSObject {
    

    func getLaunhesList() {
        
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
        
        SX_Service.shared.execute(requst, expecting: SX_GetLaunchesDataSet.self) {result in
            switch result {
            case .success(let model):
                print(model.docs[3])
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension LaunchesListViewModel : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounders = UIScreen.main.bounds
        let width = (bounders.width - 20)
        
        return CGSize(width: width, height: (width * 1.5))
    }
}
