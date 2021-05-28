//
//  ReposListViewController.swift
//  iOS-Template
//
//  Created by apple on 28/05/21.
//

import UIKit

final class ReposListViewController: UIViewController {
  
  private let user: GithubUser
  private let listView: UICollectionView
  private var repositoriesDataSource: RepositoriesDataSource!
  
  init(user: GithubUser) {
    self.user = user
    listView = UICollectionView(frame: .zero, collectionViewLayout: .insetGroupedListLayout)
    super.init(nibName: nil, bundle: nil)
    let registration = UICollectionView.CellRegistration<UICollectionViewListCell, Repository> { (cell, _, repository) in
      var configuration = cell.defaultContentConfiguration()
      configuration.text = repository.name
      cell.contentConfiguration = configuration
    }
    self.repositoriesDataSource = RepositoriesDataSource(
      collectionView: listView,
      cellProvider: { [weak self] (collectionView, indexPath, _) -> UICollectionViewCell? in
        guard let repository = self?.repositoriesDataSource?[indexPath] else { return nil }
        return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: repository)
      }
    )
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    self.view = listView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemRed
  }
  
}
