module axi_va_pa_ip
  #(
    parameter AXI_DATA_WIDTH = 32,
    parameter AXI_ID_WIDTH   = 4,
    parameter AXI_USER_WIDTH = 4,
    parameter LAT = 5
  )
  (
    input  logic                      axi4_aclk,
    input  logic                      axi4_arstn,

    //AXI address read signals
    input  logic   [AXI_ID_WIDTH-1:0] s_axi4_arid,
    input  logic               [31:0] s_axi4_araddr,
    input  logic                      s_axi4_arvalid,
    output logic                      s_axi4_arready,
    input  logic                [7:0] s_axi4_arlen,
    input  logic                [2:0] s_axi4_arsize,
    input  logic                [1:0] s_axi4_arburst,
    input  logic                      s_axi4_arlock,
    input  logic                [2:0] s_axi4_arprot,
    input  logic                [3:0] s_axi4_arcache,
    input  logic [AXI_USER_WIDTH-1:0] s_axi4_aruser,

    output logic   [AXI_ID_WIDTH-1:0] m_axi4_arid,
    output logic               [31:0] m_axi4_araddr,
    output logic                      m_axi4_arvalid,
    input  logic                      m_axi4_arready,
    output logic                [7:0] m_axi4_arlen,
    output logic                [2:0] m_axi4_arsize,
    output logic                [1:0] m_axi4_arburst,
    output logic                      m_axi4_arlock,
    output logic                [2:0] m_axi4_arprot,
    output logic                [3:0] m_axi4_arcache,
    output logic [AXI_USER_WIDTH-1:0] m_axi4_aruser,

    //AXI data read signals
    output logic   [AXI_ID_WIDTH-1:0] s_axi4_rid,
    output logic                [1:0] s_axi4_rresp,
    output logic [AXI_DATA_WIDTH-1:0] s_axi4_rdata,
    output logic                      s_axi4_rlast,
    output logic                      s_axi4_rvalid,
    output logic [AXI_USER_WIDTH-1:0] s_axi4_ruser,
    input  logic                      s_axi4_rready,

    input  logic   [AXI_ID_WIDTH-1:0] m_axi4_rid,
    input  logic                [1:0] m_axi4_rresp,
    input  logic [AXI_DATA_WIDTH-1:0] m_axi4_rdata,
    input  logic                      m_axi4_rlast,
    input  logic                      m_axi4_rvalid,
    input  logic [AXI_USER_WIDTH-1:0] m_axi4_ruser,
    output logic                      m_axi4_rready,

   //AXI write address signals
    input  logic   [AXI_ID_WIDTH-1:0] s_axi4_awid,
    input  logic               [31:0] s_axi4_awaddr,
    input  logic                      s_axi4_awvalid,
    output logic                      s_axi4_awready,
    input  logic                [7:0] s_axi4_awlen,
    input  logic                [2:0] s_axi4_awsize,
    input  logic                [1:0] s_axi4_awburst,
    input  logic                      s_axi4_awlock,
    input  logic                [2:0] s_axi4_awprot,
    input  logic                [3:0] s_axi4_awcache,
    input  logic                [3:0] s_axi4_awregion,
    input  logic                [3:0] s_axi4_awqos,
    input  logic [AXI_USER_WIDTH-1:0] s_axi4_awuser,

    output logic   [AXI_ID_WIDTH-1:0] m_axi4_awid,
    output logic               [31:0] m_axi4_awaddr,
    output logic                      m_axi4_awvalid,
    input  logic                      m_axi4_awready,
    output logic                [7:0] m_axi4_awlen,
    output logic                [2:0] m_axi4_awsize,
    output logic                [1:0] m_axi4_awburst,
    output logic                      m_axi4_awlock,
    output logic                [2:0] m_axi4_awprot,
    output logic                [3:0] m_axi4_awcache,
    output logic                [3:0] m_axi4_awregion,
    output logic                [3:0] m_axi4_awqos,
    output logic [AXI_USER_WIDTH-1:0] m_axi4_awuser,

    // AXI W data channel
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
    output logic   [AXI_USER_WIDTH-1:0] m_axi4_wuser,


    // AXI write response channel
    output logic   [AXI_ID_WIDTH-1:0] s_axi4_bid,
    output logic                [1:0] s_axi4_bresp,
    output logic                      s_axi4_bvalid,
    output logic [AXI_USER_WIDTH-1:0] s_axi4_buser,
    input  logic                      s_axi4_bready,

    input  logic   [AXI_ID_WIDTH-1:0] m_axi4_bid,
    input  logic                [1:0] m_axi4_bresp,
    input  logic                      m_axi4_bvalid,
    input  logic [AXI_USER_WIDTH-1:0] m_axi4_buser,
    output logic                      m_axi4_bready

  );

  axi4_ar_buffer #(
                   .AXI_ID_WIDTH(AXI_ID_WIDTH),
                   .AXI_USER_WIDTH(AXI_USER_WIDTH),
                   .LAT(LAT)
                  )

                 ar (
                      .axi4_aclk      (axi4_aclk),
                      .axi4_arstn     (axi4_arstn),
                      .s_axi4_arid    (s_axi4_arid   ),
                      .s_axi4_araddr  (s_axi4_araddr ),
                      .s_axi4_arvalid (s_axi4_arvalid),
                      .s_axi4_arready (s_axi4_arready),
                      .s_axi4_arlen   (s_axi4_arlen  ),
                      .s_axi4_arsize  (s_axi4_arsize ),
                      .s_axi4_arburst (s_axi4_arburst),
                      .s_axi4_arlock  (s_axi4_arlock ),
                      .s_axi4_arprot  (s_axi4_arprot ),
                      .s_axi4_arcache (s_axi4_arcache),
                      .s_axi4_aruser  (s_axi4_aruser ),
                      .m_axi4_arid    (m_axi4_arid   ),
                      .m_axi4_araddr  (m_axi4_araddr ),
                      .m_axi4_arvalid (m_axi4_arvalid),
                      .m_axi4_arready (m_axi4_arready),
                      .m_axi4_arlen   (m_axi4_arlen  ),
                      .m_axi4_arsize  (m_axi4_arsize ),
                      .m_axi4_arburst (m_axi4_arburst),
                      .m_axi4_arlock  (m_axi4_arlock ),
                      .m_axi4_arprot  (m_axi4_arprot ),
                      .m_axi4_arcache (m_axi4_arcache),
                      .m_axi4_aruser  (m_axi4_aruser )
                     );

  axi4_r_buffer #(
                   .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
                   .AXI_ID_WIDTH(AXI_ID_WIDTH),
                   .AXI_USER_WIDTH(AXI_USER_WIDTH)
                 )

               r (
                    .axi4_aclk   (axi4_aclk),
                    .axi4_arstn  (axi4_arstn),
                    .s_axi4_rid  (s_axi4_rid),
                    .s_axi4_rresp(s_axi4_rresp),
                    .s_axi4_rdata(s_axi4_rdata),
                    .s_axi4_rlast(s_axi4_rlast),
                    .s_axi4_rvalid(s_axi4_rvalid),
                    .s_axi4_ruser(s_axi4_ruser),
                    .s_axi4_rready(s_axi4_rready),
                    .m_axi4_rid (m_axi4_rid),
                    .m_axi4_rresp(m_axi4_rresp),
                    .m_axi4_rdata(m_axi4_rdata),
                    .m_axi4_rlast(m_axi4_rlast),
                    .m_axi4_rvalid(m_axi4_rvalid),
                    .m_axi4_ruser(m_axi4_ruser),
                    .m_axi4_rready(m_axi4_rready)
                 );

  axi4_aw_buffer #(
                    .AXI_ID_WIDTH (AXI_ID_WIDTH)   ,
                    .AXI_USER_WIDTH (AXI_USER_WIDTH) ,
                    .LAT (LAT)
                  )

               aw (
                     .axi4_aclk      (axi4_aclk),
                     .axi4_arstn     (axi4_arstn),
                     .s_axi4_awid    (s_axi4_awid),
                     .s_axi4_awaddr  (s_axi4_awaddr),
                     .s_axi4_awvalid (s_axi4_awvalid),
                     .s_axi4_awready (s_axi4_awready),
                     .s_axi4_awlen   (s_axi4_awlen),
                     .s_axi4_awsize  (s_axi4_awsize),
                     .s_axi4_awburst (s_axi4_awburst),
                     .s_axi4_awlock  (s_axi4_awlock),
                     .s_axi4_awprot  (s_axi4_awprot),
                     .s_axi4_awcache (s_axi4_awcache),
                     .s_axi4_awregion(s_axi4_awregion),
                     .s_axi4_awqos   (s_axi4_awqos),
                     .s_axi4_awuser  (s_axi4_awuser),
                     .m_axi4_awid    (m_axi4_awid),
                     .m_axi4_awaddr (m_axi4_awaddr),
                     .m_axi4_awvalid (m_axi4_awvalid),
                     .m_axi4_awready (m_axi4_awready),
                     .m_axi4_awlen   (m_axi4_awlen),
                     .m_axi4_awsize  (m_axi4_awsize),
                     .m_axi4_awburst (m_axi4_awburst),
                     .m_axi4_awlock  (m_axi4_awlock),
                     .m_axi4_awprot  (m_axi4_awprot),
                     .m_axi4_awcache (m_axi4_awcache),
                     .m_axi4_awregion(m_axi4_awregion),
                     .m_axi4_awqos   (m_axi4_awqos),
                     .m_axi4_awuser  (m_axi4_awuser)
                  );

   axi4_w_buffer #(
                     .AXI_DATA_WIDTH(AXI_DATA_WIDTH)   ,
                     .AXI_ID_WIDTH  (AXI_ID_WIDTH  )   ,
                     .AXI_USER_WIDTH(AXI_USER_WIDTH)
                  )

                w (
                     .axi4_aclk    (axi4_aclk),
                     .axi4_arstn   (axi4_arstn),
                     .s_axi4_wdata (s_axi4_wdata),
                     .s_axi4_wvalid(s_axi4_wvalid),
                     .s_axi4_wready(s_axi4_wready),
                     .s_axi4_wstrb (s_axi4_wstrb),
                     .s_axi4_wlast (s_axi4_wlast),
                     .s_axi4_wuser (s_axi4_wuser),
                     .m_axi4_wdata (m_axi4_wdata),
                     .m_axi4_wvalid(m_axi4_wvalid),
                     .m_axi4_wready(m_axi4_wready),
                     .m_axi4_wstrb (m_axi4_wstrb),
                     .m_axi4_wlast (m_axi4_wlast),
                     .m_axi4_wuser (m_axi4_wuser)
                  );

  axi4_b_buffer #(
                   .AXI_ID_WIDTH   (AXI_ID_WIDTH  )  ,
                   .AXI_USER_WIDTH (AXI_USER_WIDTH)
                 )

               b (
                    .axi4_aclk    (axi4_aclk),
                    .axi4_arstn   (axi4_arstn),
                    .s_axi4_bid   (s_axi4_bid),
                    .s_axi4_bresp (s_axi4_bresp),
                    .s_axi4_bvalid(s_axi4_bvalid),
                    .s_axi4_buser (s_axi4_buser),
                    .s_axi4_bready(s_axi4_bready),
                    .m_axi4_bid   (m_axi4_bid),
                    .m_axi4_bresp (m_axi4_bresp),
                    .m_axi4_bvalid(m_axi4_bvalid),
                    .m_axi4_buser (m_axi4_buser),
                    .m_axi4_bready(m_axi4_bready)
                 );
endmodule
