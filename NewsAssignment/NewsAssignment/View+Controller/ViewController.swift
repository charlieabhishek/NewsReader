//
//  ViewController.swift
//  NewsAssignment
//
//  Created by Abhishek Kumar on 12/11/20.
//

import UIKit
import SafariServices


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    let cellIdentifer = "newsCell"
    let viewModel: LandingViewModel = LandingViewModel()
    @IBOutlet weak var mTableView: UITableView!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: self.cellIdentifer)

        NetworkService().requestMostPopularViewed(urlStr: urlMostPopularView) { (error, news) in
            DispatchQueue.main.async {
                if news != nil {
                    self.viewModel.newsModel.results = news!
                    self.mTableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsModel.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as! NewsTableViewCell
        cell.titleLabel.text = viewModel.getTitle(for: indexPath.row)
        cell.authorLabel.text = viewModel.getAuthor(for: indexPath.row)
        cell.dateLabel.text = viewModel.getDate(for: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        selectedIndex = indexPath.row
        
        guard let urlStr = viewModel.newsModel.results?[self.selectedIndex].url else { return }
        
        if let url = URL(string: urlStr) {
               let config = SFSafariViewController.Configuration()
               config.entersReaderIfAvailable = true
               let vc = SFSafariViewController(url: url, configuration: config)
               present(vc, animated: true)
           }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}


