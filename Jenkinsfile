pipeline
{
    agent any
        environment {
             withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'cred_123']])
   {
    sh("export access_key=${AWS_ACCESS_KEY_ID} ")
    sh("export secret_key=${AWS_SECRET_ACCESS_KEY}")
}
       ami_linux="${ami_linux}"
       ec2_instance_type1="${ec2_instance_type}"
       key_name="${key_name}"
       ec2_instance_name="${ec2_instance_name}"
       access_key="${access_key}"
       secret_key="${secret_key}"
       public_key="${public_key}"
    }
 parameters {
        string(name: 'ami_linux', defaultValue: 'xxx', description: 'AMI setup',)
        string(name: 'ec2_instance_type1', defaultValue: 'xxx', description: 'ec2 instance type',)
        string(name: 'key_name', defaultValue: 'xxx', description: 'ssh key name',)
        string(name: 'ec2_instance_name', defaultValue: 'xxx', description: 'EC2 instance name',)
        choice(name: 'action', description: '', choices: ['apply' , 'destroy'])
    }
   
    
        stages{
            stage("Checkout repository"){
                steps{
                    checkout scm
                }
                }
             stage('OS PROVISION') {
            steps {
                
                    sh """
                    export ami_linux=${ami_linux}
                    export ec2_instance_type1=${ec2_instance_type1}
                    export key_name=${key_name}
                    export ec2_instance_name=${ec2_instance_name}
                   
                    export public_key=${public_key}
                    """
              
            }
        }
            


            
            stage("terraform Initialized"){
                steps{
                    sh("terraform init -reconfigure" )
                }
            }
            stage("terraform plan"){
                steps{
                    sh("terraform plan")
                }
            }
            stage("terraform action"){
                steps{
                      echo "Terraform action is --> ${action}"
                      sh("terraform ${action} --auto-approve")
                }
            }
        }
    }
