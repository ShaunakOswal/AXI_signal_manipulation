onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /axi_va_pa_ip_tb/CLK
add wave -noupdate /axi_va_pa_ip_tb/nRST
add wave -noupdate -group ar /axi_va_pa_ip_tb/s_axi4_arid
add wave -noupdate -group ar /axi_va_pa_ip_tb/s_axi4_araddr
add wave -noupdate -group ar /axi_va_pa_ip_tb/s_axi4_arvalid
add wave -noupdate -group ar /axi_va_pa_ip_tb/s_axi4_arready
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/s_axi4_arlen
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/s_axi4_arsize
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/s_axi4_arburst
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/s_axi4_arlock
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/s_axi4_arprot
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/s_axi4_arcache
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/s_axi4_aruser
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/m_axi4_arlen
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/m_axi4_arsize
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/m_axi4_arburst
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/m_axi4_arlock
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/m_axi4_arprot
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/m_axi4_arcache
add wave -noupdate -group ar -group static /axi_va_pa_ip_tb/m_axi4_aruser
add wave -noupdate -group ar /axi_va_pa_ip_tb/m_axi4_arid
add wave -noupdate -group ar /axi_va_pa_ip_tb/m_axi4_araddr
add wave -noupdate -group ar /axi_va_pa_ip_tb/m_axi4_arvalid
add wave -noupdate -group ar /axi_va_pa_ip_tb/m_axi4_arready
add wave -noupdate -group r /axi_va_pa_ip_tb/s_axi4_rid
add wave -noupdate -group r /axi_va_pa_ip_tb/s_axi4_rdata
add wave -noupdate -group r /axi_va_pa_ip_tb/s_axi4_rvalid
add wave -noupdate -group r /axi_va_pa_ip_tb/s_axi4_rready
add wave -noupdate -group r -group static /axi_va_pa_ip_tb/s_axi4_rresp
add wave -noupdate -group r -group static /axi_va_pa_ip_tb/s_axi4_rlast
add wave -noupdate -group r -group static /axi_va_pa_ip_tb/s_axi4_ruser
add wave -noupdate -group r -group static /axi_va_pa_ip_tb/m_axi4_rresp
add wave -noupdate -group r -group static /axi_va_pa_ip_tb/m_axi4_rlast
add wave -noupdate -group r -group static /axi_va_pa_ip_tb/m_axi4_ruser
add wave -noupdate -group r /axi_va_pa_ip_tb/m_axi4_rid
add wave -noupdate -group r /axi_va_pa_ip_tb/m_axi4_rdata
add wave -noupdate -group r /axi_va_pa_ip_tb/m_axi4_rvalid
add wave -noupdate -group r /axi_va_pa_ip_tb/m_axi4_rready
add wave -noupdate -group aw /axi_va_pa_ip_tb/s_axi4_awid
add wave -noupdate -group aw /axi_va_pa_ip_tb/s_axi4_awaddr
add wave -noupdate -group aw /axi_va_pa_ip_tb/s_axi4_awvalid
add wave -noupdate -group aw /axi_va_pa_ip_tb/s_axi4_awready
add wave -noupdate -group aw -group static /axi_va_pa_ip_tb/s_axi4_awlen
add wave -noupdate -group aw -group static /axi_va_pa_ip_tb/s_axi4_awsize
add wave -noupdate -group aw -group static /axi_va_pa_ip_tb/s_axi4_awburst
add wave -noupdate -group aw -group static /axi_va_pa_ip_tb/s_axi4_awlock
add wave -noupdate -group aw -group static /axi_va_pa_ip_tb/s_axi4_awprot
add wave -noupdate -group aw -group static /axi_va_pa_ip_tb/s_axi4_awcache
add wave -noupdate -group aw -group static /axi_va_pa_ip_tb/s_axi4_awregion
add wave -noupdate -group aw -group static /axi_va_pa_ip_tb/s_axi4_awqos
add wave -noupdate -group aw -group static /axi_va_pa_ip_tb/s_axi4_awuser
add wave -noupdate -group aw -group static -group static_m /axi_va_pa_ip_tb/m_axi4_awlen
add wave -noupdate -group aw -group static -group static_m /axi_va_pa_ip_tb/m_axi4_awsize
add wave -noupdate -group aw -group static -group static_m /axi_va_pa_ip_tb/m_axi4_awburst
add wave -noupdate -group aw -group static -group static_m /axi_va_pa_ip_tb/m_axi4_awlock
add wave -noupdate -group aw -group static -group static_m /axi_va_pa_ip_tb/m_axi4_awprot
add wave -noupdate -group aw -group static -group static_m /axi_va_pa_ip_tb/m_axi4_awcache
add wave -noupdate -group aw -group static -group static_m /axi_va_pa_ip_tb/m_axi4_awregion
add wave -noupdate -group aw -group static -group static_m /axi_va_pa_ip_tb/m_axi4_awqos
add wave -noupdate -group aw -group static -group static_m /axi_va_pa_ip_tb/m_axi4_awuser
add wave -noupdate -group aw /axi_va_pa_ip_tb/m_axi4_awid
add wave -noupdate -group aw /axi_va_pa_ip_tb/m_axi4_awaddr
add wave -noupdate -group aw /axi_va_pa_ip_tb/m_axi4_awvalid
add wave -noupdate -group aw /axi_va_pa_ip_tb/m_axi4_awready
add wave -noupdate -group w /axi_va_pa_ip_tb/s_axi4_wdata
add wave -noupdate -group w /axi_va_pa_ip_tb/s_axi4_wvalid
add wave -noupdate -group w /axi_va_pa_ip_tb/s_axi4_wready
add wave -noupdate -group w /axi_va_pa_ip_tb/s_axi4_wstrb
add wave -noupdate -group w -group static /axi_va_pa_ip_tb/s_axi4_wlast
add wave -noupdate -group w -group static /axi_va_pa_ip_tb/s_axi4_wuser
add wave -noupdate -group w -group static /axi_va_pa_ip_tb/m_axi4_wlast
add wave -noupdate -group w -group static /axi_va_pa_ip_tb/m_axi4_wuser
add wave -noupdate -group w /axi_va_pa_ip_tb/m_axi4_wdata
add wave -noupdate -group w /axi_va_pa_ip_tb/m_axi4_wvalid
add wave -noupdate -group w /axi_va_pa_ip_tb/m_axi4_wready
add wave -noupdate -group w /axi_va_pa_ip_tb/m_axi4_wstrb
add wave -noupdate -group b /axi_va_pa_ip_tb/s_axi4_bid
add wave -noupdate -group b /axi_va_pa_ip_tb/s_axi4_bvalid
add wave -noupdate -group b /axi_va_pa_ip_tb/s_axi4_bready
add wave -noupdate -group b -group static /axi_va_pa_ip_tb/s_axi4_bresp
add wave -noupdate -group b -group static /axi_va_pa_ip_tb/s_axi4_buser
add wave -noupdate -group b -group static /axi_va_pa_ip_tb/m_axi4_bresp
add wave -noupdate -group b -group static /axi_va_pa_ip_tb/m_axi4_buser
add wave -noupdate -group b /axi_va_pa_ip_tb/m_axi4_bid
add wave -noupdate -group b /axi_va_pa_ip_tb/m_axi4_bvalid
add wave -noupdate -group b /axi_va_pa_ip_tb/m_axi4_bready
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_arid
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_awid
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_rid
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_bid
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_araddr
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_awaddr
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_rdata
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_wdata
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_wstrb
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/rcurr_time
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/wcurr_time
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_rtime
add wave -noupdate -group tb_signals /axi_va_pa_ip_tb/popped_wtime
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {256 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 169
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {240 ns} {346 ns}
