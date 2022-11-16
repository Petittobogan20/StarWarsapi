
import UIKit

class StarwarsViewController: UIViewController {
    
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var filmsLabel: UILabel!
    
    @IBOutlet weak var lLabel: UILabel!
    
    
    @IBOutlet weak var eyecolorLabel: UILabel!
    
    @IBOutlet weak var haircolorLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var person: Starwaarjsonfile?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = person?.name
        haircolorLabel.text = person?.hair_color
        eyecolorLabel.text = person?.eye_color
        lLabel.text = person?.skin_color
        filmsLabel.text = person?.homeworld
        subtitleLabel.text = person?.films
    }

}
