pipeline {
  agent {
    docker {
      image 'jare/alpine-vim'
    }

  }
  stages {
    stage('Install') {
      steps {
        sh '''mkdir .vim
mv ~/* .vim/ 
ln -s ~/.vim/vimrc ~/.vimrc; 
vim +PlugInstall +qall;'''
      }
    }
  }
}