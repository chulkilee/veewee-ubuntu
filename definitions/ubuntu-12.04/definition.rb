Veewee::Session.declare(
  iso_file: 'ubuntu-12.04.2-server-amd64.iso',
  iso_md5: '7d186655efe871ea1a1492faf635beee',
  iso_src: 'http://releases.ubuntu.com/12.04/ubuntu-12.04.2-server-amd64.iso',
  
  boot_wait: '10',
  cpu_count: '1',
  disk_format: 'VDI',
  disk_size: '40960',
  hostiocache: 'off',
  iso_download_timeout: '1000',
  kickstart_port: '7122',
  kickstart_timeout: '10000',
  memory_size: '512',
  postinstall_timeout: '10000',
  ssh_guest_port: '22',
  ssh_host_port: '7222',
  ssh_key: '',
  ssh_login_timeout: '10000',
  ssh_password: 'vagrant',
  ssh_user: 'vagrant',
  sudo_cmd: "echo '%p'|sudo -S sh '%f'",
  
  virtualbox: {
    vm_options: {
      ioapic: 'on',
      pae: 'on',
    }
  },
  
  boot_cmd_sequence: [
    '<Esc><Esc><Enter>',
    '/install/vmlinuz' ,
    ' auto',
    ' console-setup/ask_detect=false',
    ' console-setup/layoutcode=us',
    ' console-setup/modelcode=pc105',
    ' debconf/frontend=noninteractive',
    ' debian-installer=en_US',
    ' fb=false',
    ' initrd=/install/initrd.gz',
    ' kbd-chooser/method=us',
    ' keyboard-configuration/layout=USA',
    ' keyboard-configuration/variant=USA',
    ' locale=en_US',
    ' netcfg/get_domain=vm',
    ' netcfg/get_hostname=vagrant',
    ' noapic' ,
    ' preseed/url=http://%IP%:%PORT%/preseed.cfg',
    ' -- ',
    '<Enter>',
  ],
  os_type_id: 'Ubuntu_64',
  postinstall_files: [
    'update.sh',
    'chef-client.sh',
    'vagrant.sh',
    'networking.sh',
    'nfs.sh',
    'sudoers.sh',
    'cleanup.sh',
    'minimize.sh',
  ],
  kickstart_file: 'preseed.cfg',
  shutdown_cmd: 'shutdown -P now'
)
