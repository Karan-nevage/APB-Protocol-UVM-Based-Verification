//=============================================================================================
// File: /master/apb_magent.sv
// Description: Defines the APB master agent for the APB UVC. This class extends uvm_agent to
//              integrate the driver, sequencer, monitor, and coverage components for APB master
//              transaction generation and verification.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

class apb_magent extends uvm_agent;

    //====================< Class Members >========================
    apb_drv drv;                            // Driver for driving APB transactions
    apb_sqr sqr;                            // Sequencer for controlling sequence execution
    apb_mon mon;                            // Monitor for observing APB transactions
    apb_cov cov;                            // Coverage subscriber for collecting functional coverage
    `uvm_component_utils(apb_magent)        // Register with UVM factory
    `NEW_COMP                               // Use predefined component constructor macro

    //====================< Build Phase >========================
    // Creates driver, sequencer, monitor, and coverage components
    function void build();
        drv = apb_drv::type_id::create("drv", this);    // Create driver instance
        sqr = apb_sqr::type_id::create("sqr", this);    // Create sequencer instance
        cov = apb_cov::type_id::create("cov", this);    // Create coverage subscriber instance
        mon = apb_mon::type_id::create("mon", this);    // Create monitor instance
    endfunction

    //====================< Connect Phase >========================
    // Connects driver to sequencer and monitor to coverage subscriber
    function void connect();
        //`uvm_info("MAGENT", "Connect phase hitted", UVM_HIGH)
        //----> Connect driver’s sequence item port to sequencer’s export
        //drv.seq_item_port.connect(sqr.seq_item_export);
        //----> Connect monitor’s analysis port to coverage subscriber’s export
        mon.ap_port.connect(cov.analysis_export);        // Connect monitor to coverage
    endfunction

endclass
//=============================================================================================