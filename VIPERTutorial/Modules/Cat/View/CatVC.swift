//
//  ViewController.swift
//  VIPERTutorial
//
//  Created by admin on 2.02.2023.
//

import UIKit

class CatVC: UIViewController{
    //MARK: - Properties
    
    var presenter: CatViewToPresenter?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var generateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Generate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(generateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    //MARK: - Handlers
    
    @objc func generateButtonTapped(){
        presenter?.generateImage()
    }
    
    func configUI(){
        view.backgroundColor = .white
        
        view.addSubview(generateButton)
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            // generateButton constraints
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            // imageView constraints
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: generateButton.topAnchor, constant: -50)
        ])
    }
}

//MARK: - PresenterToView Methods

extension CatVC: CatPresenterToView{
    func sendImageToView(_ image: UIImage) {
        
        self.imageView.image = image
    }
}
