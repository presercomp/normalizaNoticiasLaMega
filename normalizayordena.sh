for f in *.pdf; do 
    IFS='-'
    read -a file <<< "$f"
    YEAR="${file[0]}"
    MONTH="${file[1]}"
    TITLE="${file[3]}_${file[4]}_${file[5]}_${file[6]}_${file[7]}"
    next=""
    TITLE=${TITLE/.pdf/$next}
    TITLE="${TITLE}.pdf"
    IFS=' '
    read -a nday <<< "${file[2]}"
    DAY="${nday[0]}"
    TITLE="${nday[1]}_${TITLE}"
    TITLE=$(echo "$TITLE" | tr -s 'á' 'a' | tr -s 'é' 'e' | tr -s 'í' 'i' | tr -s 'ó' 'o' | tr -s 'ú' 'u')
    TITLE=$(echo "$TITLE" | tr -s 'ä' 'a' | tr -s 'ë' 'e' | tr -s 'ï' 'i' | tr -s 'ö' 'o' | tr -s 'ü' 'u')
    TITLE=$(echo "$TITLE" | tr -s 'Á' 'A' | tr -s 'É' 'E' | tr -s 'Í' 'I' | tr -s 'Ó' 'O' | tr -s 'Ú' 'U')
    TITLE=$(echo "$TITLE" | tr -s 'Ä' 'A' | tr -s 'Ë' 'E' | tr -s 'Ï' 'I' | tr -s 'Ö' 'O' | tr -s 'Ü' 'U')
    TITLE=$(echo "$TITLE" | tr -s 'ñ' 'n' | tr -s 'Ñ' 'N' | tr -d '#' | tr -d '"' | tr -d '“' | tr -d '”') 
    SOURCE="${PWD}/${f}"
    DESTINY="${PWD}/${YEAR}"
    case $MONTH in
        01)
            DESTINY="${DESTINY}/01_enero"        
        ;;
        02)
            DESTINY="${DESTINY}/02_febrero"
        ;;
        03)
            DESTINY="${DESTINY}/03_marzo"
        ;;
        04)
            DESTINY="${DESTINY}/04_abril"
        ;;
        05)
            DESTINY="${DESTINY}/05_mayo"
        ;;    
        06)
            DESTINY="${DESTINY}/06_junio"
        ;;
        07)
            DESTINY="${DESTINY}/07_julio"
        ;;
        08)
            DESTINY="${DESTINY}/08_agosto"
        ;;
        09)
            DESTINY="${DESTINY}/09_septiembre"
        ;;
        10)
            DESTINY="${DESTINY}/10_octubre"
        ;;
        11)
            DESTINY="${DESTINY}/11_noviembre"
        ;;
        12)
            DESTINY="${DESTINY}/12_diciembre"
        ;;
    esac
    DESTINY="${DESTINY}/${DAY}"
    mkdir -m 0777 -p $DESTINY
    DESTINY="${DESTINY}/${TITLE}"
    mv "$SOURCE" $DESTINY    
    echo "${SOURCE} > ${DESTINY}"
done