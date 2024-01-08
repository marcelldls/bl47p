#!/bin/bash
mkdir -p /epics/opi

pandablocks-ioc softioc bl47p-mo-panda-01 BL47P-EA-PANDA-01 --clear-bobfiles --screens-dir /epics/opis


