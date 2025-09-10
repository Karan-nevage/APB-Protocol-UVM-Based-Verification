//=============================================================================================
// File: /master/apb_cov.sv
// Description: Implements the coverage subscriber for the APB UVC master. This class extends
//              uvm_subscriber to collect functional coverage for APB transactions, focusing on
//              address coverage.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

class apb_cov extends uvm_subscriber#(apb_tx);

    //====================< Class Members >========================
    apb_tx tx;                                      // APB transaction for coverage sampling
    `uvm_component_utils(apb_cov)                   // Register with UVM factory

    //====================< Constructor >========================
    // Creates a new coverage subscriber and initializes the covergroup
    function new(string name = "", uvm_component parent);
        super.new(name, parent);                    // Call parent constructor
        apb_cg = new();                             // Create covergroup instance
    endfunction

    //====================< Covergroup Definition >========================
    // Defines coverage points for APB transactions
    covergroup apb_cg;
        addr_cp: coverpoint tx.paddr {              // Coverpoint for address field
            option.auto_bin_max = 4;                // Limit to 4 automatic bins
        }
    endgroup

    //====================< Write Method >========================
    // Samples coverage data when a transaction is received
    function void write(apb_tx t);
        $cast(tx, t);                               // Cast input transaction to apb_tx
        apb_cg.sample();                            // Sample coverage for the transaction
    endfunction

endclass
//=============================================================================================