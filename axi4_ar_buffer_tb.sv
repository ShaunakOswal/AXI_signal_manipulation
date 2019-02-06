// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module axi4_ar_buffer_tb;

  parameter PERIOD = 10;
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

  int wait_cycles;
  logic [AXI_ID_WIDTH-1:0] arid_que[$], popped_arid;
  logic [31:0] araddr_que[$], popped_araddr;
  time curr_time, time_que[$], popped_time;

  // clock
  always #(PERIOD/2) CLK++;

  axi4_ar_buffer #(
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
                      .m_axi4_aruser  (m_axi4_aruser )
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
    nRST = 1;
    @(posedge CLK);
    #3;
    nRST = 0;
    #50;
    @(posedge CLK);
    nRST = 1;
    @(posedge CLK);
    repeat (1000)
    begin
      wait_cycles = $urandom_range(0,10);
      s_axi4_arid = $urandom_range(0,(2**AXI_ID_WIDTH) - 1);
      arid_que.push_back(s_axi4_arid);
      s_axi4_araddr = $urandom_range(0, (2**32) - 1);
      araddr_que.push_back(s_axi4_araddr);
      time_que.push_back($time());
      s_axi4_arvalid = 1'b1;
      #1;
      wait(s_axi4_arready);
      @(posedge CLK);
      s_axi4_arvalid = 1'b0;
      repeat(wait_cycles)
        @(posedge CLK);
    end
    $finish();

  end

  always @ (posedge CLK)
  begin
      m_axi4_arready = $urandom_range(0,1);
      #5;
      if (m_axi4_arready && m_axi4_arvalid) begin
        curr_time = $time();
        popped_araddr = araddr_que.pop_front();
        popped_arid = arid_que.pop_front();
        popped_time = time_que.pop_front();
        assert(m_axi4_araddr == (popped_araddr + 'h1000)) else $error("invalid add recvd = %0d, should've been = %0d @",m_axi4_araddr, m_axi4_araddr, $time() );
        assert(m_axi4_arid == popped_arid) else $error("invalid arid rcvd = %0d, should've been = %d @",m_axi4_arid ,popped_arid,$time());
        assert(curr_time > (popped_time + LAT - 1)) else $error("invalid latency delay = %0d, should've been at least = %0d",curr_time, (popped_time + LAT - 1));
      end
  end


endmodule
