# Linux HW1

При помощи packer создан образ ВМ, в котором на исходный образ Centos с помощью  
скриптов в секции `provisioners` установлено свежее ядро из репозитория ElRepo

Образ загружен в Vagrant Cloud:
<https://app.vagrantup.com/nitrate/boxes/centos-7-5>

### "*"
В каталоге `/kernel` Vagrantfile для загрузки и сборки  
lt-ядра 5.4.115 скриптом из каталога `/kernel/scripts`  
Скрипт скачивает и устанавливает lt-ядро с сайта <https://www.kernel.org/>  
Версия vagrant box = "1905.1"  
У ВМ выставлены память 4 GB и CPU 4 ядра, использована опция `make -j$(nproc)` для уменьшения времени сборки ядра.  

### "**"
Для работы Shared Folders в Vagrant файле раскомментирована строка с их конфигом: `config.vm.synced_folder "./sync", "/vagrant"`
Каталог ./sync указан, что бы по дефолту не синхронизировался весь каталог с файлом Vagrant.
