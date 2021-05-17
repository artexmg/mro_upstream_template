#!/bin/bash

usage() {
    echo "Usage: emr_bootstrap.sh <parameters>"
    echo "Parameters:"
    echo "  [--src-s3-path <s3 path to sync>]"
    echo "  [--dst-local-path <local path to sync with s3>]"
    echo "  [--environment-name <environment name (DEV|TEST|PROD)>]"
    echo "  [--help]"

    exit $1
}

while [ -n "$1" ]; do
    case "$1" in
        --src-s3-path)
            SRC_S3_PATH="$2"
            shift 2
            ;;
        --dst-local-path)
            DST_LOCAL_PATH="$2"
            shift 2
            ;;
        --environment-name)
            ENV="$2"
            shift 2
            ;;
        --help)
            usage 0
            ;;
        *)
            echo "Error: unkown parameter \"$1\"" >&2
            usage 255
            ;;
    esac
done

umask 0002

if [ -z "$DST_LOCAL_PATH" ]; then
    DST_LOCAL_PATH=/opt/mdp-artifacts
fi

if [ -n "$SRC_S3_PATH" ]; then
    sudo aws s3 sync "$SRC_S3_PATH" "$DST_LOCAL_PATH"
    sudo chown -R hadoop "$DST_LOCAL_PATH"
    tar -C "$DST_LOCAL_PATH" -xzvf "${DST_LOCAL_PATH}/dist/mdp_template_lower_upstream-0.1.0.tar.gz"
    # Uncomment and change below string
    # sudo chmod 0755 "${DST_LOCAL_PATH}/app-0.1.0/app/<subpath_to_script>"
fi

# Install extra packages
sudo yum makecache
sudo yum install -y jq python3-pip

sudo pip3 install wheel pypandoc
sudo pip3 install "${DST_LOCAL_PATH}/dist/mdp_template_lower_upstream-0.1.0-py3-none-any.whl"
