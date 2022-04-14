#Conta il numero di file in una cartella
if [ $# -eq 1 ];then 
#if [ ! $# -ne 1 ];then 
    numfile=$(ls -l $1|wc -l)
    let numfile=$numfile-1
    echo "Sono presenti $numfile file nella cartella $1"
else
    numfile=$(ls -l|wc -l)
    let numfile=$numfile-1
    echo "Sono presenti $numfile file nella cartella $PWD"
fi
