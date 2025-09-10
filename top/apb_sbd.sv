//=============================================================================================
// File: /top/apb_sbd.sv
// Description: Defines the UVM scoreboard class for APB protocol verification.
//              Tracks matches and mismatches for transaction-level and byte-level comparisons.
//              Maintains separate queues for master and slave transactions.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

`uvm_analysis_imp_decl(_master)
`uvm_analysis_imp_decl(_slave)

class apb_sbd extends uvm_scoreboard;

    //====================< Class Members >========================
    uvm_analysis_imp_master#(apb_tx, apb_sbd) imp_master;   // Analysis port for master transactions
    uvm_analysis_imp_slave#(apb_tx, apb_sbd) imp_slave;     // Analysis port for slave transactions
    //apb_tx mst_tx, slv_tx;                                // Transaction instances (currently disabled)
    `uvm_component_utils(apb_sbd)                           // Register with UVM factory
    `NEW_COMP                                               // Macro for constructor

    //====================< Build Phase >========================
    // Allocates memory for master and slave analysis ports
    function void build();
        imp_master = new("imp_master", this);               // Create master analysis port
        imp_slave = new("imp_slave", this);                 // Create slave analysis port
    endfunction

    //====================< Run Phase >========================
    // Compares master and slave transactions, updating match/mismatch counts
    task run();
        forever begin
            `uvm_info("SBD", "Runt Task Hitted", UVM_HIGH)
            // Comparison logic to be implemented
        end
    endtask

endclass
//=============================================================================================