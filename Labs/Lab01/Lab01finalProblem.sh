head -n 1 PredPreyData.csv > New_PredPreyData.csv
tail -n 10 PredPreyData.csv >> New_PredPreyData.csv
cut -f 2-4 -d , New_PredPreyData.csv
