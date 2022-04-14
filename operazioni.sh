
#esegue istruzioni contenute nel file istruzioni.txt per copiare ed incollare i file  dalla cartA a cartB
#esempio riga istruzioni.txt = <nome_file> <num_righe_iniziali> <num_righe_finali> (ESEMPIO: test.txt 7 5)

if [ ! -f $1 ]; then
    echo "Manca il file istruzioni! Esempio stringa: /verificaIstruzioni.sh istruzioni.txt cartA cartB"
fi
if [ $# -ne 3 ]; then
    echo "Componenti non corrette! Esempio stringa: /verificaIstruzioni.sh istruzioni.txt cartA cartB"
fi
if [ ! -d $2 ]; then
    echo "Manca una directory! Esempio stringa: /verificaIstruzioni.sh istruzioni.txt cartA cartB"
fi
if [ ! -d $3 ]; then
    echo "Manca una directory! Esempio stringa: /verificaIstruzioni.sh istruzioni.txt cartA cartB"
else
    istruzioni=$(cat $1)
    count=0
    file=' '
    righeIniziali=''
    righeFinali=''
    for i in $istruzioni; do
    if [ $count -eq 0 ];then
        file=$i
        count=1
        continue
    fi
    if [ $count -eq 1 ];then
        righeIniziali=$i
        count=2
        continue
    fi
    if [ $count -eq 2 ];then
        righeFinali=$i
        if [ ! -f $2/$file ];then
            echo "File non presente nella cartella $2"
        else
            #tmp=$(echo $file | sed -e 's/\.txt//g')
            newFile="$file"_"$righeIniziali"_"$righeFinali.txt"
            touch $2/$file
            head -n $righeIniziali $2/$file >> $3/$newFile
            tail -n $righeFinali $2/$file >> $3/$newFile
        fi
        count=0
    fi
    done
fi
