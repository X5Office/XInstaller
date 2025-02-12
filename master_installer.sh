echo 'Выберите уровень установки(global/local) :'
read xbo_type
if [ "$xbo_type" = "global" ]; then
  echo 'Выбрана глобальная установка'
  cd "$path_for_globalserver" || { echo "Directory not found"; exit 1; }
  mkdir -p XBackOffice
  cd XBackOffice
  sudo apt update
  sudo apt upgrade -y
  sudo apt install -y git
  echo 'Для выбранной вами установки требуются следующие компоненты:'
  echo ' - [*] XWeb (v.R4.1);'
  echo ' - [*] XNearObserver (v.1.0.0);'
  echo ' - [*] XMasterObserver (v.1.0.0);'
  echo
  echo
  echo 'Начинаю процедуру установки...'
  echo 'Запущена установка компонента: XWeb'
  git clone https://github.com/X5Office/XWeb.git xweb || { echo "Failed to clone XWeb"; exit 1; }
  echo 'Запущена установка компонента: XNearObserver'
  git clone https://github.com/X5Office/XNearObserver.git xnearserver || { echo "Failed to clone XNearObserver"; exit 1; }
  echo 'Запущена установка компонента: XMasterObserver'
  git clone https://github.com/X5Office/XMasterObserver.git xmasterserver || { echo "Failed to clone XMasterObserver"; exit 1; }
elif [ "$xbo_type" = "local" ]; then
  echo 'Локальная установка временно не доступна...'
else
  echo 'Ошибка ввода'
fi
