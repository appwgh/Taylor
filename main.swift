//
//  main.swift
//  Taylor
//
//  Created by Jorge Izquierdo on 21/06/14.
//  Copyright (c) 2014 Jorge Izquierdo. All rights reserved.
//

import Foundation

var port = 8080

if C_ARGC > 1 {
    
    var string = String.fromCString(C_ARGV[1])
    if let i = string.toInt() {
        port = i
    }
}

let taylor = Taylor(port: port)

//What is going on
let router = Router()
let route = Route(m: .GET, path: "/") {
    (request: Request, response: Response) in
    
    response.stringBody = "<h1>TAYLOR, SWIFT</h1>"
    response.headers["Content-type"] = "text/html"
    response.send()
    
    return true
}
router.addRoute(route)
taylor.router = router

//Cool way
taylor.get("/irene") {
    (request: Request, response: Response) in
    
    response.stringBody = "Te quiero peque"
    response.send()
    
    return true
}

taylor.startListening()

while true {
    
    NSRunLoop.mainRunLoop().run()
}