# Пути до места размещения ХВО
path_for_globalserver='/usr/'
path_for_localserver='~/'

echo 'Добро пожаловать с систему установки XBackOffice'
echo 'Выберите уровень установки(global/local) :'
read xbo_type
if [ "$xbo_type": "global" ] ; then
  echo 'Выбрана глобальная установка'
  cd $path_for_globalserver
  mkdir XBackOffice
  cd XBackOffice
  apt update
  apt upgrade
  apt install git
  echo 'Для выбранной вами установки требуются следующие компроненты:'
  echo ' - [*] XWeb (v.R4.1);'
  echo ' - [*] XNearObserver (v.1.0.0);'
  echo ' - [*] XMasterObserver (v.1.0.0);'
  echo
  echo
  echo 'Начинаю процедуру установки...'
  echo 'Запущена установка компонента: XWeb'
  git clone https://github.com/X5Office/XWeb.git xweb
  echo 'Запущена установка компонента: XNearObserver'
  git clone https://github.com/X5Office/XNearObserver.git xnearserver
  echo 'Запущена установка компонента: XMasterObserver'
  git clone https://github.com/X5Office/XMasterObserver.git xmasterserver
elif [ "$xbo_type" = "local" ]; then
  echo 'Локальная установка временно не доступна...'
else
  echo 'Ошибка ввода'