//
//  ViewController.swift
//  RentHouseApp
//
//  Created by LRui on 15/12/10.
//  Copyright © 2015年 lirui. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, BMKMapViewDelegate {

    var _mapView: BMKMapView?
    var months: [String]! = []
    var unitsSold: [Double] = []
    
    @IBOutlet weak var map: UIView!
    @IBOutlet weak var chart: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //add Map
        _mapView = BMKMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 2))
        map.addSubview(_mapView!)
        
        
        //add Chart
        months = ["Jan", "Feb", "Mar", "Apr", "May"]
        unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0]
        setChart(months, values: unitsSold)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        chart.data = chartData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        _mapView?.viewWillAppear()
        _mapView?.delegate = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        _mapView?.viewWillDisappear()
        _mapView?.delegate = nil
    }

}

