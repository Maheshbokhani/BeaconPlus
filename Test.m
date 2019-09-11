#import <Foundation/Foundation.h>
#import <MTBeaconPlus/MTBeaconPlus.h>

@interface Test : NSObject

@end

@implementation Test
- (void)voidDidLoad
{
    MTCentralManager *manager = [MTCentralManager sharedInstance];
    
    manager.stateBlock = ^(PowerState state) {
        NSLog(@"Current Bluetooth Stuatus" , state);
    };
   
    [manager startScan:^(NSArray<MTPeripheral *> *peris){
        
        // Traverse the array，get instance of every device.
        // ** you can also display them on views.
        for(NSInteger i = 0; i < peris.count; i ++){
            MTPeripheral *peri = peris[i];

            MTFrameHandler *framer = peri.framer;
            NSString *name = framer.name;          // name of device, may nil
            NSInteger rssi = framer.rssi;          // rssi
            NSInteger battery = framer.battery;    // battery,may nil
            NSString *mac = framer.mac;            // mac address,may nil
            NSArray *frames = framer.advFrames;    // all data frames of device（such as:iBeacon，UID，URL...）

        }
    }];
}
@end



