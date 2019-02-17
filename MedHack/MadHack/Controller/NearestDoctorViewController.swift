//
//  NearestDoctorViewController.swift
//  MadHack
//
//  Created by Pravin Jadhao on 17/02/19.
//  Copyright © 2019 Pravin Jadhao. All rights reserved.
//

import UIKit
import MapKit

class NearestDoctorViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView?
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocationAccess()
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last! as CLLocation
        getDoctors(latitude: "\(location.coordinate.latitude)", longitude: "\(location.coordinate.longitude)")
    }
    
    func getDoctors(latitude : String,longitude: String)
    {
        var url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?";
        url = "\(url)location=\(latitude),\(longitude)"
        url = "\(url)&radius=50000&types=doctor&sensor=true&key=AIzaSyDJy1B7HoBmLsKB72ARBAt6hxBiC_TfdkY"
    
        let apiurl = URL(string: url)!
        var request = URLRequest(url: apiurl)
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(error )")
                return
            }
            print("response = \(response)")
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
            self.parseMapData(data: data)
        }
        task.resume()
    }

    func parseMapData(data : Data)
    {
        DispatchQueue.main.async {

        do{
        let jsonDecoder = JSONDecoder()
        let mapModel = try jsonDecoder.decode(MapModel.self, from: data)
            mapModel.results?.forEach({ (result) in
                
                
                let lat = result.geometry?.location?.lat ?? 0
                let long = result.geometry?.location?.lng ?? 0
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                self.addAnotation(coordinate: coordinate, title: result.name ?? "")
            })
        }catch{
            
        }
        }
    }
    func addAnotation(coordinate : CLLocationCoordinate2D,title : String)
    {
        let london = MKPointAnnotation()
        london.title = title
        london.coordinate =  coordinate
        mapView?.delegate = self
        mapView?.addAnnotation(london)
    }
}


extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        else {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            annotationView.image = UIImage(named: "placeholder.png")
            return annotationView
        }
    }
}
