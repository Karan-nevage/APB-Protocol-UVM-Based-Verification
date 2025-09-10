//=============================================================================================
// File: /master/apb_sqr.sv
// Description: Defines a typedef for the APB sequencer in the APB UVC master. This sequencer
//              handles APB transaction sequences for the master agent.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

//====================< Sequencer Typedef >========================
// Defines the APB sequencer type for handling apb_tx transactions
typedef uvm_sequencer#(apb_tx) apb_sqr;
//=============================================================================================