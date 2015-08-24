//
//  getWorkOrderByWorkUnitController.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation

class GetWorkOrderByWorkUnitController : NSObject, WLDelegate{
    
    var feedsArray = []
//    var callerView : LoginViewController = LoginViewController()  //Defind callerView
    
    func get(workUnit: String, uiView: LoginViewController){
//        parameters : [workunit]
        
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "getWorkOrderByWorkUnit")
        invocationData.parameters = [workUnit]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        
       // callerView = uiView
        
        
    }
    
    func onSuccess(response: WLResponse!) {
        print("[GetWorkOrderByWorkUnitController] onSuccess")
        
//        self.callerView.updateView(response)
        
    }
    
    func onFailure(response: WLFailResponse!) {
        
        print("[GetWorkOrderByWorkUnitController] onFailure")
        
    }
    
}
