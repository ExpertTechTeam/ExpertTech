//
//  getWorkOrderByWorkUnitController.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation

class GetWorkOrderByWorkUnitController : NSObject, WLDelegate{
    
    func get(workUnit: String){
//        parameters : [workunit]
        
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "getWorkOrderByWorkUnit")
        invocationData.parameters = [workUnit]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        
    }
    
    func onSuccess(response: WLResponse!) {
        print("On Success")
    }
    
    func onFailure(response: WLFailResponse!) {
        print("On Failure")
    }
    
}
