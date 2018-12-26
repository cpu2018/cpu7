emit.cmo : type.cmo s.cmo lib_print_int.cmo lib_create_array.cmo id.cmo \
    asm.cmi emit.cmi
emit.cmx : type.cmx s.cmx lib_print_int.cmx lib_create_array.cmx id.cmx \
    asm.cmx emit.cmi
