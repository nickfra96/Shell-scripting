#Date due cartelle copia tutte le cartelle e sottocartelle fino al secondo livello dalla prima cartella alla seconda cartella. Inoltre si andranno a convertire tutti i file [.txt] in file [.doc].
#Ricreerà quindi lo stesso albero delle directory. 
#Esempio d’uso sarà : copia_albero.sh cartella_sorgente cartella_destinazione.

if [ ! -d $1 ];then
    echo "Parametri non validi. Esempio: copia_albero.sh cart1 cart2"
    exit -1
fi
if [ ! -d $2 ];then
    echo "Parametri non validi. Esempio: copia_albero.sh cart1 cart2"
    exit -1
fi
if [ $# -ne 2 ];then
    echo "Parametri non validi. Esempio: copia_albero.sh cart1 cart2"
else
    liv1=$(ls $1)
    temp=''
    for i in $liv1;do
        if [ -f $1/$i ];then
            temp=$(echo -n $i|sed -s 's/.txt/.doc/')
            touch $2/$temp
        else
            mkdir $2/$i
            livello2=$(ls $1/$i)
            for j in $livello2;do
                if [ -f $1/$i/$j ];then
                    temp=$(echo -n $j|sed -s 's/.txt/.doc/')
                    touch $2/$i/$temp
                else
                    mkdir $2/$i/$j
                fi
            done
        fi
    done
fi
