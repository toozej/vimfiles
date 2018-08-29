pipeline {
  agent {
    docker {
      image 'rmohta/alpine-vim8:base'
    }

  }
  stages {
    stage('Install') {
      steps {
        sh '''rm -rf /root/.vim/ /root/.vimrc;
mkdir /root/.vim/;
mv vimrc autoload /root/.vim/;
ln -s .vim/vimrc ~/.vimrc; 
vim +\'PlugInstall --sync\' +qa;'''
      }
    }
  }
}