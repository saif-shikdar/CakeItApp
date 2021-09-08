//
//  CakeDetailViewController.swift
//  CakeItApp
//
//  Created by David McCallum on 21/01/2021.
//

import UIKit
import Combine

class CakeDetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet private weak var cakeImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var viewModel:CakeDetailsViewModel!
    
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = viewModel.cakeDetails.title
        descriptionLabel.text = viewModel.cakeDetails.desc
        
        cancellable = loadImage(for: viewModel.cakeDetails.image).sink { [unowned self] image in
            self.cakeImageView.image = image
            
        }
    }
    deinit {
        cancellable?.cancel()
    }
    
    private func loadImage(for urlStr: String) -> AnyPublisher<UIImage?, Never> {
        return Just(urlStr)
            .flatMap({ poster -> AnyPublisher<UIImage?, Never> in
                let url = URL(string: urlStr)!
                return ImageLoader.shared.loadImage(from: url)
            })
            .eraseToAnyPublisher()
    }
}
