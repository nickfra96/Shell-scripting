# Conta le occorrenze di una parola in un file di testo
if [ $# -ne 2 ]; then
    echo "Argomento sbagliato ! contaparole.sh <parola> <nomeFile>"
else
    parola=$1
    nomeFile=$2
    testo=$(cat $nomeFile)
    count=0
    for i in $testo; do
        if [ $i = $parola ];then
            let count=$count+1
        fi
    done
    echo "$parola si ripete $count volte"
fi
