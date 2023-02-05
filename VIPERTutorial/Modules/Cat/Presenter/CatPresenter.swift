//
//  Presenter.swift
//  VIPERTutorial
//
//  Created by admin on 5.02.2023.
//

import UIKit

class CatPresenter: CatViewToPresenter{
    
    var interactor: CatPresenterToInteractor?
    var view: CatPresenterToView?
    
    func generateImage() {
        interactor?.generateImage()
        
    }
}

//MARK: - PresenterToView Methods
extension CatPresenter: CatInteractorToPresenter{
    func sendImageToPresenter(_ image: UIImage) {
        view?.sendImageToView(image)
    }
    
}
