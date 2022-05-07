//
//  MovieListTableViewController.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    let viewModel = MovieListViewModel()
    
    let movieListCellReuseID = "movieListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: movieListCellReuseID)
        tableView.separatorStyle = .none
        
        viewModel.getListOfMovies { [weak self] result in
            
            guard let self = self else { return }
            
            switch result{
            case .success(_):
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(_): break
                
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        viewModel.getMoviesCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieListCellReuseID, for: indexPath) as! MovieListTableViewCell
        cell.selectionStyle = .none
        
        cell.viewModel = viewModel.getTableCellViewModel(for: indexPath.row)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.showMovieDetailsScreen( viewModel.getMovieDetailsViewModel(for: indexPath.row))
    }
}

extension UINavigationController{
    func showMovieDetailsScreen(_ movieDetailsViewModel: MovieDetailsViewModel){
        pushViewController(MovieDetailsViewController(movieDetailsViewModel), animated: true)
    }
}
