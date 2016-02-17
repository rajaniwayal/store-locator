package com

class DataFeedService {

    def insertData(){
        def d = StoreParent.first();
        if (!d) {
            StoreParent oz = new StoreParent(countryName: 'New York')
             if (oz) {
                oz.save();
                 ArrayList<StoreChild> array = new ArrayList<StoreChild>();
                 array.add(new StoreChild(storeParent: oz as StoreParent,cityName: 'abc' ,zipCode: 123));
                 array.add(new StoreChild(storeParent: oz as StoreParent,cityName: 'aygbc' ,zipCode: 78))

            }

        }
    }

}
