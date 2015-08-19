//
//  InsertNewWorkUnitController.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation

class InsertNewWorkUnitController: NSObject, WLDelegate{
    
    func insert (workUnit: String, sequence: Int, status_en: String, status_th: String, product1: String, product2: String, orderno: String, gis: String, latitude: String, longtitude: String){
        //parameters : [workunit, sequence, status, product1, product2, orderno, gis, latitude, longitude]
        
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "getWorkOrderByWorkUnit")
        invocationData.parameters = [workUnit, sequence, status_en, status_th, product1, product2, orderno, gis, latitude, longtitude]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        
        
    }
    
    
    func onSuccess(response: WLResponse!) {
        print("On Success")
    }
    
    func onFailure(response: WLFailResponse!) {
        print("On Failure")
    }
}
