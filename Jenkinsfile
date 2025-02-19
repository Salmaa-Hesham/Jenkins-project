pipeline {
    agent any

    environment {
        ANSIBLE_HOST_KEY_CHECKING = "False" // Disable SSH key checking
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/Salmaa-Hesham/Jenkins-project.git'
            }
        }


        stage('Run Ansible Playbook') {
            steps {
                sh 'ansible-playbook -i inventory.ini install_nginx.yml'
            }
        }
    }
}
