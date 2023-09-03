//
//  LaunchesListViewModel.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import UIKit

protocol LaunchesListViewModelDelegate: AnyObject {
    func didLoadIntialLaunches ()
}

final class LaunchesListViewModel: NSObject {
    
    public weak var delegate: LaunchesListViewModelDelegate?
    
    private var launches : [SX_Launch] = [] {
        didSet {
            for launch in launches {
                
                print("flight Name: \(launch.flight_number)")
                
                let details = launch.details ?? "No data provided from source for Mession: \(launch.flight_number)"
                let patchImage = launch.links.patch.small ?? launch.links.patch.large ?? launch.rocket.flickr_images[0]
                
                print("patchImage: \(patchImage)")
                            
                let viewModel = LaunchCollectionViewCellViewModel(flightNumber: String(launch.flight_number), launchName: launch.name, launchDate: launch.date_utc, launchDetails: details, upComing: launch.upcoming, launchImageURL: URL(string: patchImage))
                cellViewModel.append(viewModel)
            }
        }
    }
    private var cellViewModel : [LaunchCollectionViewCellViewModel] = []

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
         ]
        },
        "options": {
            "pagination": false,
             "select": {
                   "fairings": 0,
                   "static_fire_date_utc": 0,
                   "static_fire_date_unix": 0,
                   "window": 0,
                   "net": 0,
                   "capsules": 0,
                   "payloads": 0,
                   "date_local": 0,
                   "date_precision": 0,
                   "cores": 0,
                   "tbd": 0,
                   "launch_library_id": 0
                 },
            "populate": [
            {
                "path": "rocket",
                "select": {
                "name": 1,
                "description": 1,
                "wikipedia": 1,
                "flickr_images" : 1,
                "type" : 1,
                "active" : 1,
                "stages" : 1,
                "boosters" : 1,
                "success_rate_pct" : 1,
                "first_flight" : 1,
                "country" : 1,
                "company" : 1
            }
        },
      {
          "path": "ships",
          "select": {
              "id": 1,
              "name": 1,
              "legacy_id": 1,
              "model": 1,
              "type": 1,
              "imo": 1,
              "mmsi": 1,
              "class": 1,
              "mass_kg": 1,
              "year_built": 1,
              "home_port": 1,
              "link": 1,
              "image": 1,
              "active": 1,
              "launches": 1
          }
      },
      {
          "path": "crew",
          "select": {
              "id": 1,
              "name": 1,
              "agency": 1,
              "image": 1,
              "wikipedia": 1,
            "launches": 1,
            "status": 1
            }
        }
     ]
    }
 }
 """
        let requst = SX_Request(httpMethod: "POST", endpoint: .launches,
        pathComponents: ["query"], httpBody: jsonBody)
        
        SX_Service.shared.execute(requst, expecting: SX_GetLaunchesDataSet.self) {[weak self] result in
            switch result {
            case .success(let responseModel):
                let docs = responseModel.docs
                self?.launches  = docs
                DispatchQueue.main.async {
                    self?.delegate?.didLoadIntialLaunches()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension LaunchesListViewModel : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell( withReuseIdentifier: LaunchCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? LaunchCollectionViewCell
        else {
           fatalError("Unsupported Cell")
        }
        
        let viewModel = cellViewModel[indexPath.row]
        
        cell.configure(with: viewModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 20)
        
        return CGSize(width: width, height: (width))
    }
}
