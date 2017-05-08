#!/usr/bin/env bash
set -euxo pipefail
IFS=$'\n\t'

# Pretty colors.
red='\033[0;31m'
green='\033[0;32m'
neutral='\033[0m'

declare -r OS=${1:-${OS}}
declare -r PROCESS_CONTROL=${2:-${PROCESS_CONTROL}}
declare -r PLAYBOOK=${3:-${PLAYBOOK}}
declare -r WORKSPACE=${WORKSPACE:-/tmp/example-ansible-inspec}

function cleanup() {
  docker-compose stop "${OS}"
  docker-compose rm -f "${OS}"
}

function debug() {
  local container="$(docker-compose ps -q "${OS}")"
  docker exec -it "${container}" /bin/bash
}

function main() {
  docker-compose up -d "${OS}"

  local container="$(docker-compose ps -q "${OS}")"

  # Install role.
  docker cp . "${container}:${WORKSPACE}"

  # Validate syntax
  docker exec -t "${container}" env ANSIBLE_FORCE_COLOR=1 ansible-playbook \
              -i "${WORKSPACE}/tests/inventory" \
              --syntax-check \
              -v \
              --extra-vars="example_process_control=${PROCESS_CONTROL}" \
              "${WORKSPACE}/tests/${PLAYBOOK}/default.yml"

  # Run Playbook.
  docker exec -t "${container}" env ANSIBLE_FORCE_COLOR=1 ansible-playbook \
              -i "${WORKSPACE}/tests/inventory" \
              -c local \
              -v \
              --extra-vars="example_process_control=${PROCESS_CONTROL}" \
              "${WORKSPACE}/tests/${PLAYBOOK}/default.yml"

  # Run Ansible playbook again (idempotence test).
  docker exec -t "${container}" env ANSIBLE_FORCE_COLOR=1 ansible-playbook \
              -i "${WORKSPACE}/tests/inventory" \
              -c local \
              -v \
              --extra-vars="example_process_control=${PROCESS_CONTROL}" \
              "${WORKSPACE}/tests/${PLAYBOOK}/default.yml" | tee -a $idempotence
  tail $idempotence \
  | grep -q 'changed=0.*failed=0' \
  && (printf ${green}'Idempotence test: pass'${neutral}"\n") \
  || (printf ${red}'Idempotence test: fail'${neutral}"\n" && exit 1)

  # Sleep to allow Minecraft to boot.
  # FIXME: A retry loop checking if it has launched yet would be better.
  sleep 30

  # Run tests.
  docker exec -t "${container}" rspec "${WORKSPACE}/tests/${PLAYBOOK}/spec.rb"
}

[[ -z "${CI:-}" ]] && trap debug ERR
trap cleanup EXIT

main "${@}"
