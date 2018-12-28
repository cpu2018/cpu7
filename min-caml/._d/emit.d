emit.cmo : type.cmo s.cmo lib_sc.cmo lib_print_int.cmo lib_float.cmo \
    lib_create_array.cmo lib_atan.cmo id.cmo asm.cmi emit.cmi
emit.cmx : type.cmx s.cmx lib_sc.cmx lib_print_int.cmx lib_float.cmx \
    lib_create_array.cmx lib_atan.cmx id.cmx asm.cmx emit.cmi
