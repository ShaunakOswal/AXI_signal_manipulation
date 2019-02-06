onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /axi4_ip_tb/CLK
add wave -noupdate /axi4_ip_tb/nRST
add wave -noupdate /axi4_ip_tb/s_axi4_arid
add wave -noupdate -radix unsigned /axi4_ip_tb/s_axi4_araddr
add wave -noupdate /axi4_ip_tb/s_axi4_arvalid
add wave -noupdate /axi4_ip_tb/s_axi4_arready
add wave -noupdate /axi4_ip_tb/s_axi4_arlen
add wave -noupdate /axi4_ip_tb/s_axi4_arsize
add wave -noupdate /axi4_ip_tb/s_axi4_arburst
add wave -noupdate /axi4_ip_tb/s_axi4_arlock
add wave -noupdate /axi4_ip_tb/s_axi4_arprot
add wave -noupdate /axi4_ip_tb/s_axi4_arcache
add wave -noupdate /axi4_ip_tb/s_axi4_aruser
add wave -noupdate /axi4_ip_tb/m_axi4_arid
add wave -noupdate -radix unsigned /axi4_ip_tb/m_axi4_araddr
add wave -noupdate /axi4_ip_tb/m_axi4_arvalid
add wave -noupdate /axi4_ip_tb/m_axi4_arready
add wave -noupdate /axi4_ip_tb/m_axi4_arlen
add wave -noupdate /axi4_ip_tb/m_axi4_arsize
add wave -noupdate /axi4_ip_tb/m_axi4_arburst
add wave -noupdate /axi4_ip_tb/m_axi4_arlock
add wave -noupdate /axi4_ip_tb/m_axi4_arprot
add wave -noupdate /axi4_ip_tb/m_axi4_arcache
add wave -noupdate /axi4_ip_tb/m_axi4_aruser
add wave -noupdate /axi4_ip_tb/wait_cycles
add wave -noupdate /axi4_ip_tb/DUT/u_buffer/counter
add wave -noupdate /axi4_ip_tb/DUT/u_buffer/pointer_in
add wave -noupdate /axi4_ip_tb/DUT/u_buffer/pointer_out
add wave -noupdate /axi4_ip_tb/DUT/u_buffer/elements
add wave -noupdate /axi4_ip_tb/DUT/u_buffer/buffer
add wave -noupdate /axi4_ip_tb/DUT/u_buffer/counter
add wave -noupdate /axi4_ip_tb/DUT/u_buffer/full
add wave -noupdate /axi4_ip_tb/popped_arid
add wave -noupdate /axi4_ip_tb/popped_araddr
add wave -noupdate /axi4_ip_tb/popped_time
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {95 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {234 ns}
