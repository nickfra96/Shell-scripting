#Date due cartelle, verifica la presenza di duplicati. I file duplicati verranno scritti su un file di testo con la cartella di appartenenza

if [ $# -ne 2 ]; then
    echo "Devi inserire almeno due valori. Esempio stringa: verifica_duplicati.sh file_cartelle.txt file_output.txt"
fi
if [ ! -f $1 ]; then 
    echo "Devi inserire un file! Esempio stringa: verifica_duplicati.sh file_cartelle.txt file_output.txt"
fi
if [ -f $2 ]; then
    echo "Il file di output non deve esistere !!! Lo elimino."
    echo -n > $2
else


cartelle=$(cat $1)
touch $2
count=0
for i in $cartelle;do
    if [ $count -eq 0 ];then
        file1=$(ls $i)
        let count=1
    else
        file2=$(ls $i)
        echo "sono qui"
        for j in $file1; do
            for k in $file2; do
                if [ $j = $k ]; then 
                    echo "Trovato duplicato !"
                    echo $j >> $2
                fi
            done
            #if [ -f $file2/$j ]; then
             #   echo "Trovato duplicato !"
              #  echo $j >> $2
           # fi
        done
        let count=0
    fi
done


fi
