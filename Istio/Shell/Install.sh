# Install istio profile - demo
function install_profile() {
    local INST=$(istioctl install --set profile=demo -y)
    if [[ $? -ne 0 ]]; then
        echo "Error: $INST"
        exit 1
    else
        echo "Success"
    fi
}

# Install Addons
function install_addons() {
    local ADDONS=$(kubectl apply -f samples/addons)
    if [[ $? -ne 0 ]]; then
        echo "Error: $ADDONS"
        exit 1
    else
        echo "Success"
    fi
}

function install_components() {
    case "$1" in
    "-i")
        echo "==============Installing Istio==============="
        install_profile
        ;;
    "-a")
        echo "==============Installing Addons==============="
        install_addons
        ;;
    "-ia")
        echo "==============Install Istio + Addons=========="
        install_profile
        install_addons
        ;;
    "*")
        echo "Invalid flag"
        ;;
    esac
}

if [[ $# -ne 0 ]]; then
    for ARGS in "$@"; do
        install_components $ARGS
    done
else
    echo "Enter flag:"
    echo "[-i] for installing istio"
    echo "[-a] for installing addons"
    read $FLAG
    install_components $FLAG
fi
