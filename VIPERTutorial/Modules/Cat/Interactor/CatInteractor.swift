//
//  Interactor.swift
//  VIPERTutorial
//
//  Created by admin on 5.02.2023.
//

import UIKit
import Alamofire
import Kingfisher

class CatInteractor: CatPresenterToInteractor{
    //MARK: - Properties
    private let url = "https://api.thecatapi.com/v1/images/search"
    
    var presenter: CatInteractorToPresenter?

    let downloader = ImageDownloader.default
    
    func generateImage() {
        // make a request to web service
        AF.request(url,method: .get).response { response in
            if let data = response.data{
                do{
                    // decode responseData into [CatModel]
                    let decodedData = try JSONDecoder().decode([CatModel].self, from: data)
                    let cat = decodedData[0]
                    DispatchQueue.main.async {
                        // download the cat image with the url send it to presenter
                        self.downloader.downloadImage(with: URL(string: cat.url)!){ result in
                            switch result{
                            case .success(let value):
                                self.presenter?.sendImageToPresenter(value.image)
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
