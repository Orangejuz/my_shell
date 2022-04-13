#! ./bin/sh
# set -e
echo -e "checking whethter ansibel have installed... \033[36m (￣◇￣;)  \033[0m"
is_install_ansibel=$(brew list | grep ansible)
if [ ! -n "$is_install_ansibel" ]
then
    echo -e "u need to install ansible, \033[36m (｡ì _ í｡) \033[0m"
    brew install ansible
fi

echo -e "checking whethter ansibel have installed... \033[36m (￣◇￣;)  \033[0m"
is_install_sshpass=$(brew list |grep sshpass)
if [ ! -n "$is_install_sshpass" ]
then
    echo -e "u need to install sshpass, \033[36m (｡ì _ í｡) \033[0m"
    brew install esolitos/ipa/sshpass
fi

echo -e "hello, which dev-00x u want to change kube_config? \033[36m ( ･᷄ὢ･᷅ ) \033[0m"
read -p "Please inupt: " dev_name

ip_address=$(nslookup dev-$dev_name.devops-cloud.club | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | tail -n 1)

echo $ip_address

echo "$ip_address ansible_ssh_port=36000 ansible_ssh_host=$ip_address ansible_ssh_user=root ansible_ssh_pass=C0ding@2022!" | tee tmp.txt

export ANSIBLE_HOST_KEY_CHECKING=False
ansible all -i tmp.txt -m shell -a "cat ~/.kube/config" | awk 'NR!=1' | tee ~/.kube/config-$dev_name

echo -e "update success! \033[36m O(∩_∩)O~ \033[0m"
echo -e "and the config path is here: ~/.kube/config-$dev_name"

rm tmp.txt
echo -e "Bye ~ ~ \033[36m d(^_^o) \033[0m"

