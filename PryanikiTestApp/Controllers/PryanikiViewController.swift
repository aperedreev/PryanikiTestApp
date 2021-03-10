//
//  PryanikiViewController.swift
//  PryanikiTestApp
//
//  Created by A L E X on 3/5/21.
//

import UIKit

class PryanikiViewController: UIViewController {

    // MARK: - Properties
    private var itemsData: [Sample] = []
    private var itemsList: [String] = []
    private var itemId: String?
    
    private let apiClient: ApiClient = ApiClientRequest()
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Methods
    
    private func setupView() {
        
        navigationItem.title = "Главная"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate   = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "HZTableViewCell", bundle: nil), forCellReuseIdentifier: "HZTableViewCell")
        tableView.register(UINib(nibName: "PictureTableViewCell", bundle: nil), forCellReuseIdentifier: "PictureTableViewCell")
        tableView.register(UINib(nibName: "SelectorTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectorTableViewCell")
    }
    
    private func loadData() {
        apiClient.getData(completion: {result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.itemsData = response.data
                    self.itemsList = response.view

                case .failure:
                    self.itemsData = []
                    self.itemsList = []
                    
                }
                self.tableView.reloadData()
            }
        })
    }
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        loadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let detailsVC = segue.destination as! DetailsViewController
            detailsVC.navigationItem.title = itemId
        }
    }

}

// MARK: - Extensions
extension PryanikiViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        8
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemId = itemsList[indexPath.section]
        performSegue(withIdentifier: "showDetails", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
}

extension PryanikiViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        itemsList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemsList[indexPath.section]
        
        guard let cellClass = itemsData.first(where: { (response) -> Bool in
            return response.name == item
        }) else {
            return UITableViewCell()
        }
        
        switch item {
            case "hz":
                let cell = tableView.dequeueReusableCell(withIdentifier: "HZTableViewCell", for: indexPath) as! HZTableViewCell
                
                cell.setup(data: cellClass.data)
                
                return cell
                
            case "picture":
                let cell = tableView.dequeueReusableCell(withIdentifier: "PictureTableViewCell", for: indexPath) as! PictureTableViewCell

                cell.setup(data: cellClass.data)

                return cell
                
            case "selector":
                let cell = tableView.dequeueReusableCell(withIdentifier: "SelectorTableViewCell", for: indexPath) as! SelectorTableViewCell

                cell.delegate = self
                
                cell.setup(data: cellClass.data)

                return cell
                    
            default:
                return UITableViewCell()
            }
    }
    
}

extension PryanikiViewController: SelectorDelegate {
    func segmentTapped(from selector: UISegmentedControl, to label: UILabel) {
        
        if let selectorVariants = itemsData[2].data.variants {
        
            switch selector.selectedSegmentIndex {
                case 0:
                    label.text = selectorVariants[0].text
                case 1:
                    label.text = selectorVariants[1].text
                case 2:
                    label.text = selectorVariants[2].text
                default:
                    break
            }
        }
    }
    
}
