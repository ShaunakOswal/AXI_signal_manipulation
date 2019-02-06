`timescale 1 ns / 1 ns

module axi_va_pa_ip_tb;

  parameter PERIOD = 10;
  parameter AXI_DATA_WIDTH = 32;
  parameter AXI_ID_WIDTH   = 4;
  parameter AXI_USER_WIDTH = 4;
  parameter LAT = 7;

  logic CLK = 0, nRST = 1;
  logic   [AXI_ID_WIDTH-1:0] s_axi4_arid    ;
  logic               [31:0] s_axi4_araddr  ;
  logic                      s_axi4_arvalid ;
  logic                      s_axi4_arready ;
  logic                [7:0] s_axi4_arlen   ;
  logic                [2:0] s_axi4_arsize  ;
  logic                [1:0] s_axi4_arburst ;
  logic                      s_axi4_arlock  ;
  logic                [2:0] s_axi4_arprot  ;
  logic                [3:0] s_axi4_arcache ;
  logic [AXI_USER_WIDTH-1:0] s_axi4_aruser  ;

  logic   [AXI_ID_WIDTH-1:0] m_axi4_arid    ;
  logic               [31:0] m_axi4_araddr  ;
  logic                      m_axi4_arvalid ;
  logic                      m_axi4_arready ;
  logic                [7:0] m_axi4_arlen   ;
  logic                [2:0] m_axi4_arsize  ;
  logic                [1:0] m_axi4_arburst ;
  logic                      m_axi4_arlock  ;
  logic                [2:0] m_axi4_arprot  ;
  logic                [3:0] m_axi4_arcache ;
  logic [AXI_USER_WIDTH-1:0] m_axi4_aruser  ;
  //
  logic   [AXI_ID_WIDTH-1:0] s_axi4_rid      ;
  logic                [1:0] s_axi4_rresp    ;
  logic [AXI_DATA_WIDTH-1:0] s_axi4_rdata    ;
  logic                      s_axi4_rlast    ;
  logic                      s_axi4_rvalid   ;
  logic [AXI_USER_WIDTH-1:0] s_axi4_ruser    ;
  logic                      s_axi4_rready   ;

  logic   [AXI_ID_WIDTH-1:0] m_axi4_rid      ;
  logic                [1:0] m_axi4_rresp    ;
  logic [AXI_DATA_WIDTH-1:0] m_axi4_rdata    ;
  logic                      m_axi4_rlast    ;
  logic                      m_axi4_rvalid   ;
  logic [AXI_USER_WIDTH-1:0] m_axi4_ruser    ;
  logic                      m_axi4_rready   ;
  //
  logic   [AXI_ID_WIDTH-1:0] s_axi4_awid     ;
  logic               [31:0] s_axi4_awaddr   ;
  logic                      s_axi4_awvalid  ;
  logic                      s_axi4_awready  ;
  logic                [7:0] s_axi4_awlen    ;
  logic                [2:0] s_axi4_awsize   ;
  logic                [1:0] s_axi4_awburst  ;
  logic                      s_axi4_awlock   ;
  logic                [2:0] s_axi4_awprot   ;
  logic                [3:0] s_axi4_awcache  ;
  logic                [3:0] s_axi4_awregion ;
  logic                [3:0] s_axi4_awqos    ;
  logic [AXI_USER_WIDTH-1:0] s_axi4_awuser   ;

  logic   [AXI_ID_WIDTH-1:0] m_axi4_awid     ;
  logic               [31:0] m_axi4_awaddr   ;
  logic                      m_axi4_awvalid  ;
  logic                      m_axi4_awready  ;
  logic                [7:0] m_axi4_awlen    ;
  logic                [2:0] m_axi4_awsize   ;
  logic                [1:0] m_axi4_awburst  ;
  logic                      m_axi4_awlock   ;
  logic                [2:0] m_axi4_awprot   ;
  logic                [3:0] m_axi4_awcache  ;
  logic                [3:0] m_axi4_awregion ;
  logic                [3:0] m_axi4_awqos    ;
  logic [AXI_USER_WIDTH-1:0] m_axi4_awuser   ;
  //
  logic   [AXI_DATA_WIDTH-1:0] s_axi4_wdata  ;
  logic                        s_axi4_wvalid ;
  logic                        s_axi4_wready ;
  logic [AXI_DATA_WIDTH/8-1:0] s_axi4_wstrb  ;
  logic                        s_axi4_wlast  ;
  logic   [AXI_USER_WIDTH-1:0] s_axi4_wuser  ;

  logic   [AXI_DATA_WIDTH-1:0] m_axi4_wdata  ;
  logic                        m_axi4_wvalid ;
  logic                        m_axi4_wready ;
  logic [AXI_DATA_WIDTH/8-1:0] m_axi4_wstrb  ;
  logic                        m_axi4_wlast  ;
  logic   [AXI_USER_WIDTH-1:0] m_axi4_wuser  ;
  //
  logic   [AXI_ID_WIDTH-1:0] s_axi4_bid      ;
  logic                [1:0] s_axi4_bresp    ;
  logic                      s_axi4_bvalid   ;
  logic [AXI_USER_WIDTH-1:0] s_axi4_buser    ;
  logic                      s_axi4_bready   ;

  logic   [AXI_ID_WIDTH-1:0] m_axi4_bid      ;
  logic                [1:0] m_axi4_bresp    ;
  logic                      m_axi4_bvalid   ;
  logic [AXI_USER_WIDTH-1:0] m_axi4_buser    ;
  logic                      m_axi4_bready   ;

  logic [AXI_ID_WIDTH-1:0] arid_que[$], popped_arid, awid_que[$], popped_awid, rid_que[$], popped_rid, bid_que[$], popped_bid;
  logic [31:0] araddr_que[$], popped_araddr, awaddr_que[$], popped_awaddr;
  logic [AXI_DATA_WIDTH-1:0] rdata_que[$], popped_rdata, wdata_que[$], popped_wdata;
  logic [AXI_DATA_WIDTH/8-1:0] wstrb_que[$], popped_wstrb;
  time rcurr_time, wcurr_time, rtime_que[$], wtime_que[$], popped_rtime, popped_wtime;

  // clock
  always #(PERIOD/2) CLK++;

  axi_va_pa_ip #(
                   .AXI_DATA_WIDTH(AXI_DATA_WIDTH)   ,
                   .AXI_ID_WIDTH(AXI_ID_WIDTH),
                   .AXI_USER_WIDTH(AXI_USER_WIDTH),
                   .LAT(LAT)
                  )

                 DUT (
                      .axi4_aclk      (CLK),
                      .axi4_arstn     (nRST),
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
                      .m_axi4_aruser  (m_axi4_aruser ),

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
                      .m_axi4_rready(m_axi4_rready),

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
                      .m_axi4_awuser  (m_axi4_awuser),

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
                      .m_axi4_wuser (m_axi4_wuser),

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

  initial
  begin
    s_axi4_arid    = 0;
    s_axi4_araddr  = 0;
    s_axi4_arvalid = 0;
    s_axi4_arlen   = 0;
    s_axi4_arsize  = 0;
    s_axi4_arburst = 0;
    s_axi4_arlock  = 0;
    s_axi4_arprot  = 0;
    s_axi4_arcache = 0;
    s_axi4_aruser  = 0;
    m_axi4_arready = 0;

    s_axi4_rready = 0;
    m_axi4_rid    = 0;
    m_axi4_rresp  = 0;
    m_axi4_rdata  = 0;
    m_axi4_rlast  = 0;
    m_axi4_rvalid = 0;
    m_axi4_ruser  = 0;

    s_axi4_awid     = 0;
    s_axi4_awaddr   = 0;
    s_axi4_awvalid  = 0;
    s_axi4_awlen    = 0;
    s_axi4_awsize   = 0;
    s_axi4_awburst  = 0;
    s_axi4_awlock   = 0;
    s_axi4_awprot   = 0;
    s_axi4_awcache  = 0;
    s_axi4_awregion = 0;
    s_axi4_awqos    = 0;
    s_axi4_awuser   = 0;
    m_axi4_awready  = 0;

    s_axi4_wdata    = 0;
    s_axi4_wvalid   = 0;
    s_axi4_wstrb    = 0;
    s_axi4_wlast    = 0;
    s_axi4_wuser    = 0;
    m_axi4_wready   = 0;

    s_axi4_bready   = 0;
    m_axi4_bid      = 0;
    m_axi4_bresp    = 0;
    m_axi4_bvalid   = 0;
    m_axi4_buser    = 0;



    nRST = 1;
    @(posedge CLK);
    #3;
    nRST = 0;
    #50;
    @(posedge CLK);
    nRST = 1;
    @(posedge CLK);

    fork
      send_areads();
      send_dreturns();
      send_awrite_dwrites();
      send_b_retruns();
    join
    $finish();

  end


  task send_areads;
    int wait_cycles;
    repeat (1000)
    begin
      wait_cycles = $urandom_range(0,10);
      s_axi4_arid = $urandom_range(0,(2**AXI_ID_WIDTH) - 1);
      arid_que.push_back(s_axi4_arid);
      s_axi4_araddr = $urandom_range(0, (2**32) - 1);
      araddr_que.push_back(s_axi4_araddr);
      rtime_que.push_back($time());
      s_axi4_arvalid = 1'b1;
      #1;
      wait(s_axi4_arready);
      @(posedge CLK);
      s_axi4_arvalid = 1'b0;
      repeat(wait_cycles)
        @(posedge CLK);
    end
  endtask

  always @ (posedge CLK)
  begin
      m_axi4_arready = $urandom_range(0,1);
      #5;
      if (m_axi4_arready && m_axi4_arvalid) begin
        rcurr_time = $time();
        popped_araddr = araddr_que.pop_front();
        popped_arid = arid_que.pop_front();
        popped_rtime = rtime_que.pop_front();
        assert(m_axi4_araddr == (popped_araddr + 'h1000)) else $display("invalid add recvd = %0d, should've been = %0d @",m_axi4_araddr, popped_araddr, $time() );
        assert(m_axi4_arid == popped_arid) else $display("invalid arid rcvd = %0d, should've been = %d @",m_axi4_arid ,popped_arid,$time());
        assert(rcurr_time > (popped_rtime + LAT - 1)) else $display("invalid latency delay = %0d, should've been at least = %0d",rcurr_time, (popped_rtime + LAT - 1));
      end
  end


  task send_dreturns;
    int wait_cycles;
    repeat (1000)
    begin
      wait_cycles = $urandom_range(0,10);
      m_axi4_rid = $urandom_range(0,(2**AXI_ID_WIDTH) - 1);
      rid_que.push_back(m_axi4_rid);
      m_axi4_rdata = $urandom_range(0, (2**32) - 1);
      rdata_que.push_back(m_axi4_rdata);
      m_axi4_rvalid = 1'b1;
      #1;
      wait(m_axi4_rready);
      @(posedge CLK);
      m_axi4_rvalid = 1'b0;
      repeat(wait_cycles)
        @(posedge CLK);
    end
  endtask

  always @ (posedge CLK)
  begin
      s_axi4_rready = $urandom_range(0,1);
      #5;
      if (s_axi4_rready && s_axi4_rvalid) begin
        popped_rdata = rdata_que.pop_front();
        popped_rid = rid_que.pop_front();
        assert(s_axi4_rdata == popped_rdata) else $display("invalid data recvd = %0d, should've been = %0d @",s_axi4_rdata, popped_rdata, $time() );
        assert(s_axi4_rid == popped_rid) else $display("invalid rid rcvd = %0d, should've been = %d @",s_axi4_rid ,popped_rid,$time());
      end
  end


  task send_awrite_dwrites;
    int wait_cycles;
    repeat (1000)
    begin
      wait_cycles = $urandom_range(0,10);
      s_axi4_awid = $urandom_range(0,(2**AXI_ID_WIDTH) - 1);
      awid_que.push_back(s_axi4_awid);
      s_axi4_awaddr = $urandom_range(0, (2**32) - 1);
      awaddr_que.push_back(s_axi4_awaddr);
      wtime_que.push_back($time());
      s_axi4_awvalid = 1'b1;
      #1;
      wait(s_axi4_awready);
      @(posedge CLK);
      s_axi4_awvalid = 1'b0;
      repeat(wait_cycles)
        @(posedge CLK);

      s_axi4_wdata = $urandom_range(0,(2**AXI_DATA_WIDTH) - 1);
      wdata_que.push_back(s_axi4_wdata);
      s_axi4_wstrb = $urandom_range(1,(2**(AXI_DATA_WIDTH/8)) - 1);
      wstrb_que.push_back(s_axi4_wstrb);
      s_axi4_wvalid = 1'b1;
      #1;
      wait_cycles = $urandom_range(0,10);
      wait(s_axi4_wready);
      @(posedge CLK);
      s_axi4_wvalid = 1'b0;
      repeat(wait_cycles)
        @(posedge CLK);

    end
  endtask

  always @ (posedge CLK)
  begin
      if (m_axi4_awvalid && m_axi4_wvalid) begin
         m_axi4_awready = $urandom_range(0,1);
         m_axi4_wready = m_axi4_awready;
      end
      else begin
         m_axi4_awready = 1'b0;
         m_axi4_wready = 1'b0;
      end
      #5;
      if (m_axi4_awready && m_axi4_awvalid) begin
        wcurr_time = $time();
        popped_awaddr = awaddr_que.pop_front();
        popped_awid = awid_que.pop_front();
        popped_wtime = wtime_que.pop_front();
        assert(m_axi4_awaddr == (popped_awaddr + 'h1000)) else $display("invalid add recvd = %0d, should've been = %0d @",m_axi4_awaddr, popped_awaddr, $time() );
        assert(m_axi4_awid == popped_awid) else $display("invalid awid rcvd = %0d, should've been = %d @",m_axi4_awid ,popped_awid,$time());
        assert(wcurr_time > (popped_wtime + LAT - 1)) else $display("invalid latency delay = %0d, should've been at least = %0d",wcurr_time, (popped_wtime + LAT - 1));
      end
      if (m_axi4_wready && m_axi4_wvalid) begin
        popped_wdata = wdata_que.pop_front();
        popped_wstrb = wstrb_que.pop_front();
        assert(m_axi4_wdata == popped_wdata) else $display("invalid wdata recvd = %0d, should've been = %0d @",m_axi4_wdata, popped_wdata, $time() );
        assert(m_axi4_wstrb == popped_wstrb) else $display("invalid wstrb rcvd = %0d, should've been = %d @",m_axi4_wstrb ,popped_wstrb,$time());
      end
  end

  task send_b_retruns;
    int wait_cycles;
    repeat (1000)
    begin
      wait_cycles = $urandom_range(0,10);
      m_axi4_bid = $urandom_range(0,(2**AXI_ID_WIDTH) - 1);
      bid_que.push_back(m_axi4_bid);
      m_axi4_bvalid = 1'b1;
      #1;
      wait(m_axi4_bready);
      @(posedge CLK);
      m_axi4_bvalid = 1'b0;
      repeat(wait_cycles)
        @(posedge CLK);
    end
  endtask

  always @ (posedge CLK)
  begin
      s_axi4_bready = $urandom_range(0,1);
      #5;
      if (s_axi4_bready && s_axi4_bvalid) begin
        popped_bid = bid_que.pop_front();
        assert(s_axi4_bid == popped_bid) else $display("invalid bid rcvd = %0d, should've been = %d @",s_axi4_bid ,popped_bid,$time());
      end
  end

endmodule
