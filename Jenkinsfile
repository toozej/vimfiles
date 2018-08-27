pipeline {
  agent {
    docker {
      image 'jare/alpine-vim'
    }

  }
  stages {
    stage('Install') {
      steps {
        sh '''ln -s ~/.vim/vimrc ~/.vimrc; 
vim +PlugInstall +qall;'''
      }
    }
  }
}