#!/bin/bash

FTRACE=/sys/kernel/debug/tracing
workload=vsx


# ==  complete trace  ===
echo 0 > $FTRACE/trace

# consider all the functions for now
echo > $FTRACE/set_graph_function

# using function graph for now
echo function_graph > $FTRACE/current_tracer

# enable
echo 1 > $FTRACE/tracing_on

./$workload

# disable tracing
echo 0 > $FTRACE/tracing_on

cat $FTRACE/trace > output_all.txt


# == Focused tracing now ===
 
echo 0 > $FTRACE/trace

# consider all the functions for now
echo vsx_unavailable_exception > $FTRACE/set_graph_function
echo enable_kernel_vsx >> $FTRACE/set_graph_function

# using function graph for now
echo function_graph > $FTRACE/current_tracer

# enable
echo 1 > $FTRACE/tracing_on

./$workload

# disable tracing
echo 0 > $FTRACE/tracing_on

cat $FTRACE/trace > output_vsx.txt
