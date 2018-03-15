#!/bin/bash

echo quit | telnet localhost 2003 2> /dev/null | grep -q Connected
