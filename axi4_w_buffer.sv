// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

//import CfMath::log2;

module axi4_w_buffer
  #(
    parameter AXI_DATA_WIDTH   = 32,
    parameter AXI_ID_WIDTH     = 4,
    parameter AXI_USER_WIDTH   = 4
  )
  (
    input  logic                        axi4_aclk,
    input  logic                        axi4_arstn,


    // AXI W channel interfaces
    input  logic   [AXI_DATA_WIDTH-1:0] s_axi4_wdata,
    input  logic                        s_axi4_wvalid,
    output logic                        s_axi4_wready,
    input  logic [AXI_DATA_WIDTH/8-1:0] s_axi4_wstrb,
    input  logic                        s_axi4_wlast,
    input  logic   [AXI_USER_WIDTH-1:0] s_axi4_wuser,

    output logic   [AXI_DATA_WIDTH-1:0] m_axi4_wdata,
    output logic                        m_axi4_wvalid,
    input  logic                        m_axi4_wready,
    output logic [AXI_DATA_WIDTH/8-1:0] m_axi4_wstrb,
    output logic                        m_axi4_wlast,
    output logic   [AXI_USER_WIDTH-1:0] m_axi4_wuser
  );

  localparam BUFFER_WIDTH  = AXI_DATA_WIDTH+AXI_USER_WIDTH+AXI_DATA_WIDTH/8+1;

  localparam INPUT_BUFFER_DEPTH = 4;

  axi_buffer_rab
    #(
      .DATA_WIDTH       ( BUFFER_WIDTH        ),
      .BUFFER_DEPTH     ( INPUT_BUFFER_DEPTH  )
      )
    u_input_buf
    (
      .clk       ( axi4_aclk                                                ),
      .rstn      ( axi4_arstn                                               ),
      // Push
      .data_in   ( {s_axi4_wuser, s_axi4_wstrb, s_axi4_wdata, s_axi4_wlast} ),
      .valid_in  ( s_axi4_wvalid                                            ),
      .ready_out ( s_axi4_wready                                            ),
      // Pop
      .data_out  ( {m_axi4_wuser,   m_axi4_wstrb,   m_axi4_wdata,   m_axi4_wlast}   ),
      .valid_out ( m_axi4_wvalid                                              ),
      .ready_in  ( m_axi4_wready                                              )
    );



endmodule
