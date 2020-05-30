import UIKit
import Alamofire

class NetworkServices {
    
    static func getPhotos(completion: @escaping (Dictionary<String, Any>) -> Void)  {
        let url: String = "https://api.nasa.gov/planetary/apod?api_key=\(NetworkKeyAndConstants.apiKey)"
        
        AF.request(url, method: .get, parameters: [:])
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                if let data = response.data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let dataDictionary = json as? [String: Any] {
                            //checking the type. Is it a dictionary? If it is run the code, if not, stop. SAFE Optional Unwrapping on line 16.
                            // json has been converted to dictionary
                           
                            completion(dataDictionary) 
                            
                            print(dataDictionary)
                            print(dataDictionary["title"] ?? "")
                            // ?? is giving an alternative in case the optional hs nil value. Searching for a value by key in a dictionary is always an optional
                            
                        }
                    } catch {
                        //error handling
                    }
                } else {
                    //error handling
                }
        }
    }
    
}


