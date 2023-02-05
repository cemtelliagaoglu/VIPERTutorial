//
//  CatPageRouter.swift
//  VIPERTutorial
//
//  Created by admin on 5.02.2023.
//

import UIKit

class CatRouter: CatPresenterToRouter{
    
    static func createModule() -> UIViewController {
        let viewController = CatVC()
        let presenter = CatPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.interactor = CatInteractor()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
