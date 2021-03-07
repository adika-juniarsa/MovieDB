//
//  MovieDetailScreenViewController.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

class MovieDetailScreenViewController: BaseViewController {
    
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
    
    let trailersCell = "TrailersCell"
    let sectionGrid: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    
    var presenter: MovieDetailScreenViewToPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        presenter?.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func buttonBackTouchUp(_ sender: Any) {
        presenter?.buttonBackTouchUp()
    }
    
    @IBAction func buttonOpenUserReviews(_ sender: Any) {
        presenter?.buttonOpenUserReviews()
    }
}

extension MovieDetailScreenViewController: MovieDetailScreenPresenterToViewProtocol {
    
    func setupView(withMovie movie: Movie) {
        labelTitle.text = movie.title
        labelRating.text = movie.getRatings()
        labelReleaseDate.text = movie.getReleaseDate()
        labelOverview.text = movie.overview
        viewImage.setRadius(8)
        imageMovie.clipsToBounds = true
        imageMovie.setImage(with: movie.imageUrl())
    }
    
    func setupHeader() {
        viewHeader.addBottomShadow()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: trailersCell, bundle: nil), forCellWithReuseIdentifier: trailersCell)
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}

extension MovieDetailScreenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter!.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trailersCell, for: indexPath) as! TrailersCell
        cell.tag = indexPath.row
        cell.delegate = self
        cell.setupView(withTrailers: presenter!.cellForItemAt(indexPath.row))
        return cell
    }
}

extension MovieDetailScreenViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = (collectionView.bounds.width - 24)/2.0
        let yourHeight: CGFloat = 150.0
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionGrid
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension MovieDetailScreenViewController: TrailersCellDelegate {
    
    func gotoPlayer(withIndex index: Int) {
        presenter?.gotoPlayer(withIndex: index)
    }
}
