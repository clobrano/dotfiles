## Script help
## usage: <script-name> [options]
## options:

while getopts "h" OPT; do
    case $OPT in
        h)
            ## -h          Show this help message
            sed "s/<script-name>/$(basename $0)/g" $0 | sed -n 's/^## \(.*\)/\1/p'
            sed -n 's/\s## \(.*\)/\1/p' $0
            exit 1
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done
