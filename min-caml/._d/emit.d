emit.cmo : type.cmo s.cmo lib_sc.cmo lib_read.cmo lib_print_int.cmo \
    lib_float_value.cmo lib_extarr.cmo lib_create_array.cmo lib_atan.cmo \
    id.cmo asm.cmi emit.cmi
emit.cmx : type.cmx s.cmx lib_sc.cmx lib_read.cmx lib_print_int.cmx \
    lib_float_value.cmx lib_extarr.cmx lib_create_array.cmx lib_atan.cmx \
    id.cmx asm.cmx emit.cmi
