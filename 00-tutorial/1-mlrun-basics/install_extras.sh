#!/usr/bin/env bash
echo "0" > /root/installed
pip install plotly~=5.4
echo "1" > /root/installed
pip install matplotlib seaborn~=0.11.0 scikit-plot~=0.3.7 matplotlib~=3.0
echo "2" > /root/installed

