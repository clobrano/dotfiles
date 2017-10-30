#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
git config --global user.name "Carlo Lobrano"
git config --global user.email c.lobrano@gmail.com
git config --global merge.tool gvimdiff

touch ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
