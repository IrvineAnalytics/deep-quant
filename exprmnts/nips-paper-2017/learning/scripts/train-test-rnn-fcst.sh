#!/bin/bash

BIN=~/work/deep-quant/scripts

CUDA_VISIBLE_DEVICES="" $BIN/deep_quant.py --config=config/rnn-fcst.conf --train=True > output/ouput-rnn-fcst-train.txt  2> stderr-rnn-fcst.txt  ;

CUDA_VISIBLE_DEVICES="" $BIN/deep_quant.py --config=config/rnn-fcst.conf \
    --train=False --pretty_print_preds=True  \
    --mse_outfile=output/mse-rnn-fcst-pretty.dat > output/predicts-rnn-fcst-pretty.dat  2> stderr-rnn-fcst-pretty.txt ;

CUDA_VISIBLE_DEVICES="" $BIN/deep_quant.py --config=config/rnn-fcst.conf \
    --train=False --datafile=source-ml-data-100M.dat --pretty_print_preds=False \
    --mse_outfile=output/mse-rnn-fcst-ugly.dat > output/predicts-rnn-fcst-ugly.dat        2> stderr-rnn-fcst-ugly.txt ;



