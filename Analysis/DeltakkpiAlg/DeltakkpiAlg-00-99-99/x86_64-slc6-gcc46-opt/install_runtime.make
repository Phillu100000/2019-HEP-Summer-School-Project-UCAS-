#-- start of make_header -----------------

#====================================
#  Document install_runtime
#
#   Generated Fri Jul 19 12:31:25 2019  by kc2019
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_install_runtime_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_runtime_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_install_runtime

DeltakkpiAlg_tag = $(tag)

#cmt_local_tagfile_install_runtime = $(DeltakkpiAlg_tag)_install_runtime.make
cmt_local_tagfile_install_runtime = $(bin)$(DeltakkpiAlg_tag)_install_runtime.make

else

tags      = $(tag),$(CMTEXTRATAGS)

DeltakkpiAlg_tag = $(tag)

#cmt_local_tagfile_install_runtime = $(DeltakkpiAlg_tag).make
cmt_local_tagfile_install_runtime = $(bin)$(DeltakkpiAlg_tag).make

endif

include $(cmt_local_tagfile_install_runtime)
#-include $(cmt_local_tagfile_install_runtime)

ifdef cmt_install_runtime_has_target_tag

cmt_final_setup_install_runtime = $(bin)setup_install_runtime.make
cmt_dependencies_in_install_runtime = $(bin)dependencies_install_runtime.in
#cmt_final_setup_install_runtime = $(bin)DeltakkpiAlg_install_runtimesetup.make
cmt_local_install_runtime_makefile = $(bin)install_runtime.make

else

cmt_final_setup_install_runtime = $(bin)setup.make
cmt_dependencies_in_install_runtime = $(bin)dependencies.in
#cmt_final_setup_install_runtime = $(bin)DeltakkpiAlgsetup.make
cmt_local_install_runtime_makefile = $(bin)install_runtime.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)DeltakkpiAlgsetup.make

#install_runtime :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'install_runtime'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = install_runtime/
#install_runtime::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------


ifeq ($(INSTALLAREA),)
installarea = $(CMTINSTALLAREA)
else
ifeq ($(findstring `,$(INSTALLAREA)),`)
installarea = $(shell $(subst `,, $(INSTALLAREA)))
else
installarea = $(INSTALLAREA)
endif
endif

install_dir = ${installarea}/share

install_runtime :: install_runtimeinstall

install :: install_runtimeinstall

install_runtimeclean :: install_runtimeuninstall

uninstall :: install_runtimeuninstall



jobOptions_Deltakkpi_txt_dependencies = ../share/jobOptions_Deltakkpi.txt


install_runtimeinstall :: ${install_dir}/jobOptions_Deltakkpi.txt
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

${install_dir}/jobOptions_Deltakkpi.txt :: ../share/jobOptions_Deltakkpi.txt
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../share/jobOptions_Deltakkpi.txt`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "jobOptions_Deltakkpi.txt" "$(install_dir)" "cp -R" ; \
	fi

install_runtimeuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../share/jobOptions_Deltakkpi.txt`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "jobOptions_Deltakkpi.txt" "$(install_dir)" "cp -R" ; \
	fi
#-- start of cleanup_header --------------

clean :: install_runtimeclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(install_runtime.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

install_runtimeclean ::
#-- end of cleanup_header ---------------
