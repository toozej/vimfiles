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
mv vimrc autoload README.md .gitignore .git Jenkinsfile .vim/ 
ln -s .vim/vimrc ~/.vimrc; 
vim +PlugInstall +qall;'''
      }
    }
  }
}