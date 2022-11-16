
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var persons = [Starwaarjsonfile]()
    
    //Adding new comment
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        downloadJSON {
//            self.tableView.reloadData()
//            print("success")
//        }
        
        tableView.delegate = self
        tableView.dataSource = self
        downloadJSON()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let person = persons[indexPath.row]
        cell.textLabel?.text = person.name.capitalized
        cell.detailTextLabel?.text = person.hair_color.capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? StarwarsViewController {
            destination.person = persons[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    func downloadJSON() {
        guard let url = URL(string: "https://swapi.py4e.com/api/people/") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            
            data, response, error in
            
            if let data = data {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    let parsedData = try? decoder.decode([Starwaarjsonfile].self, from: data)
                        print("Parsed Data:, \(parsedData)")
                    self.persons = parsedData!
                    
                    parsedData!.forEach { i in
                        
                        
                    }
                    
//                    self.persons = try JSONDecoder().decode([Starwaarjsonfile].self, from: data!)
//
//                    DispatchQueue.main.async {
//                        completed()
//                    }
                    
                }
                catch {
                    print(error.localizedDescription)
                }
                
            }
            
        }
        
        task.resume()
    }


}

