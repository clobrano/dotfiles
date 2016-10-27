while getopts "" OPT; do
    case $OPT in
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done
