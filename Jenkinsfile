pipeline {
  agent {
    docker {
      image 'rmohta/alpine-vim8'
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