#!/bin/bash
cd /home/rafael/Projetos/ms/Covid19BR
Rscript get_ms_data.R
Rscript get_google_data.R
Rscript get_jhu_data.R

git add .
git commit -m "update `date`"
git push -u origin --all