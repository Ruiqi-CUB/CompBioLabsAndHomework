head -n 1 PredPreyData.csv > Process_PredPreyData.csv
tail -n 10 PredPreyData.csv >> Process_PredPreyData.csv
cut -f 2-4 -d , Process_PredPreyData.csv > New_PredPreyData.csv
rm Process_PredPreyData.csv
