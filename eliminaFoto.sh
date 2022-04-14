#Elimina formati immagine di tipo [.jpg], [.gif]
if [ ! -d $3 ];then
    echo "Deve essere una directory! Esempio stringa: eliminafoto.sh jpg gif cart_foto"
fi
if [ $# -ne 3 ];then
    echo "Deve contenere 3 parametri! Esempio stringa: eliminafoto.sh jpg gif cart_foto"
else
    cartella=$(ls $3)
    tmpFile=''
    fileEliminati=0
    fileJPG=0
    echo $cartella
    for file in $cartella;do
        tmpFile=$( echo -n $file | sed -e 's/'$1'/'$2'/' )
        if [ ! -f $3/$tmpFile ];then
            rm $3/$file
            echo 'Il file '$file' è stato eliminato perchè non è corrispondente con il secondo formato.'
            let fileEliminati=$fileEliminati+1
        else
            if [ "$file" != "$tmpFile" ];then
                let fileJPG=$fileJPG+1
            fi        
        fi
    done
    echo 'File eliminati:'$fileEliminati''
    echo 'File jpg rimanenti:'$fileJPG''
fi
