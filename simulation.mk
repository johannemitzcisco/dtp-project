# This file can be added to the current NSO project root directory to add functionality to the current Makefile that is
# created when one starts a project with the ncs-project command.  This is the project specific settings that will be used
# by the general use setupsimulation.mk.  The purpose is to be able to use the same setupsimulation.mk file while putting
# specific project settings in this file.  To incorporate into the project please add the following lines to the
# Makefile of the project
#
# include ./simulation.mk
# include $(NSO_TOOLS_DIR)/setupsimulation.mk

# The version of NSO to base this on
NSO_VERSION = 4.6.1
# Directory where packages that should be included in the PROJECT_PACKAGES directory with
# symbolic links
LOCAL_PACKAGES_DIR = /opt/projects/packages
# Packages that are in the LOCAL_PACKAGES_DIR that will be symbolically link in the PROJECT_PACKAGES
# directory
LOCAL_PACKAGES += dtp-network dtp-fop-node-network-device dtp-fop-link-network-device 
LOCAL_PACKAGES += dtp-fop-node-nexus9k dtp-fop-node-csp2100
#LOCAL_PACKAGES += dtp-deployment-netsim nso-device-management

# List of simulated [device name prefixes:number of devices(0 if no netsim devices of this type should be created
# but the NED should be present):device-types (NEDS)] that will be used
DEVICES += esc-ned:0:esc:ned-only
DEVICES += csp-ned:0:csp:ned-only
DEVICES += nexus-ned:0:cisco-nx:ned-only iosxr-ned:0:cisco-iosxr:ned-only
DEVICES += xr:3:cisco-ios:sim

# Where the NEDs are located and soft links will be created to
NSO_NEDS = /opt/NSO/neds/$(NSO_VERSION)

# The NETSIM directory to use
NETSIM_DIR = netsim

# The directory to load initial data (xml files) into NSO from
INIT_DATA_DIR = init_data

# Directories listed here will have their contents deleted during the clean operation and recreated as 
# part of the build operation
NSO_DIRS = ncs-cdb state logs $(NETSIM_DIR) $(INIT_DATA_DIR) 

# Where the project packages located
PROJECT_PACKAGES = packages

# Directories with where xml data files that should be loaded after NSO is started
NSO_POST_START_DATA_DIR = project_data

NSO_TOOLS_DIR= /opt/nsotools
