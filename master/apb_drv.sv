//=============================================================================================
// File: /master/apb_drv.sv
// Description: Implements the APB driver for the APB UVC master. This class extends uvm_driver
//              to drive APB transactions to the DUT via the APB interface.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

class apb_drv extends uvm_driver;

    //====================< Class Members >========================
    virtual apb_intf vif;                   // Virtual interface for APB signals
    apb_tx tx;                              // APB transaction to be driven
    `uvm_component_utils(apb_drv)           // Register with UVM factory
    `NEW_COMP                               // Use predefined component constructor macro

    //====================< Run Phase >========================
    // Drives APB transactions to the DUT (to be implemented)
    task run();
        // Retrieve virtual interface from resource database
        uvm_resource_db#(virtual apb_intf)::read_by_name("GLOBAL", "PIF", vif, this);
        wait (vif.presetN == 1);            // Wait for reset deassertion
        forever begin
            // Transaction driving logic to be implemented
        end
    endtask

endclass
//=============================================================================================