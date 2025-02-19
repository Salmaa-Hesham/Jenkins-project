pipeline {
    agent any

    environment {
        ANSIBLE_HOST_KEY_CHECKING = "False" // Disable SSH key checking
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Salmaa-Hesham/Jenkins-project.git'
            }
        }

        stage('Install Ansible') {
            steps {
                sh 'sudo apt update && sudo apt install -y ansible'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                sh 'ansible-playbook -i inventory.ini playbook.yml'
            }
        }
    }
}
