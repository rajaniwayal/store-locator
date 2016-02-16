package com

class StoreChild {
    String cityName,zipCode
    static constraints = {
        cityName nullable: true
        zipCode nullable: true
    }
    static belongsTo = [storeParent:StoreParent]
}
