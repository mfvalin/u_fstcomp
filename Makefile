.SUFFIXES :

.SUFFIXES : .ftn .f .c .o

SHELL = /bin/sh

CPP = /lib/cpp

FFLAGS =

CFLAGS =

OPTIMIZ = -O 2
$(info OPTIMIZ is ${OPTIMIZ})

CPPFLAGS = 

VER = 8.6

LIBRMN = 

default: absolu

include $(RPN_TEMPLATE_LIBS)/include/makefile_suffix_rules.inc

FDECKS= fstcomp.f

OBJET= fstcomp.o

FICHIERS = $(FDECKS)

absolu: $(OBJET)
	s.compile -o fstcomp_$(VER)-$(BASE_ARCH) -obj $(OBJET) -abi $(ABI) -librmn $(LIBRMN)

fstcomp+: $(OBJET)
	s.compile -o fstcomp+ -debug -obj $(OBJET) -abi $(ABI) -librmn $(LIBRMN)

clean:
#Faire le grand menage. On enleve tous les fichiers sources\ninutiles et les .o 
	-if [ "*.ftn" != "`echo *.ftn`" ] ; \
	then \
	for i in *.ftn ; \
	do \
	fn=`r.basename $$i '.ftn'`; \
	rm -f $$fn.f; \
	done \
	fi
	rm *.o fstcomp_$(VER)-$(BASE_ARCH)
