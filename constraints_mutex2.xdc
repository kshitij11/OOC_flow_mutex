
create_pblock pblock_mutex
add_cells_to_pblock [get_pblocks pblock_mutex] -top
resize_pblock [get_pblocks pblock_mutex] -add {SLICE_X174Y276:SLICE_X177Y276}
set_property CONTAIN_ROUTING true [get_pblocks pblock_mutex]

set_property HD.PARTPIN_LOCS INT_R_X123Y276 [get_ports req0]
set_property HD.PARTPIN_LOCS INT_R_X123Y276 [get_ports req1]
set_property HD.PARTPIN_LOCS INT_R_X123Y276 [get_ports grant0]
set_property HD.PARTPIN_LOCS INT_R_X123Y276 [get_ports grant1]

set_property BEL C6LUT [get_cells grant0_inferred_i_1]
set_property LOC SLICE_X176Y276 [get_cells grant0_inferred_i_1]
set_property BEL B6LUT [get_cells grant1_inferred_i_1]
set_property LOC SLICE_X176Y276 [get_cells grant1_inferred_i_1]
set_property BEL D6LUT [get_cells mid0_inferred_i_1]
set_property LOC SLICE_X176Y276 [get_cells mid0_inferred_i_1]
set_property BEL A6LUT [get_cells mid1_inferred_i_1]
set_property LOC SLICE_X176Y276 [get_cells mid1_inferred_i_1]
