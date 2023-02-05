//
//  Protocols.swift
//  VIPERTutorial
//
//  Created by admin on 5.02.2023.
//

import UIKit

protocol CatViewToPresenter{
    var interactor: CatPresenterToInteractor? { get set }
    var view: CatPresenterToView? { get set }
    
    func generateImage()
}

protocol CatPresenterToInteractor{
    var presenter: CatInteractorToPresenter? { get set }
    func generateImage()
}


protocol CatInteractorToPresenter{
    func sendImageToPresenter(_ image: UIImage)
}

protocol CatPresenterToView{
    func sendImageToView(_ image: UIImage)
}

protocol CatPresenterToRouter{
    static func createModule() -> UIViewController
}
