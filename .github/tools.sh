#!/usr/bin/env bash

srcs=$(find ./ -name "*.lua")

for src in ${srcs[@]}
do
	stylua ${src}
done
