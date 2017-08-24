transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Shimizu/Desktop/ULA _3Bits/ULA _3Bits/Ula_3Bits.vhd}

