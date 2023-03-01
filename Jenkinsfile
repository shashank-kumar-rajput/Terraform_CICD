pipeline
{
    agent any
        environment {
             
       TF_VAR_ami_linux="${ami_linux}"
       TF_VAR_ec2_instance_type1="${ec2_instance_type1}"
       TF_VAR_key_name="${key_name}"
       TF_VAR_ec2_instance_name="${ec2_instance_name}"
       TF_VAR_access_key="${access_key}"
       TF_VAR_secret_key="${secret_key}"
       TF_VAR_public_key="${public_key}"

    }
 parameters {
        string(name: 'ami_linux', defaultValue: 'ami-0557a15b87f6559cf', description: 'AMI setup',)
        string(name: 'ec2_instance_type1', defaultValue: 't2.micro', description: 'ec2 instance type',)
        string(name: 'key_name', defaultValue: 'ec2-instance-tf', description: 'ssh key name',)
        string(name: 'ec2_instance_name', defaultValue: 'ec2-nginx', description: 'EC2 instance name',)
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
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'cred_123']])
   {
     sh """
                    export TF_VAR_access_key=${AWS_ACCESS_KEY_ID}
                    export TF_VAR_secret_key=${AWS_SECRET_ACCESS_KEY}
                    
                    """
}
                    sh """
                    export TF_VAR_ami_linux=${ami_linux}
                    export TF_VAR_ec2_instance_type1=${ec2_instance_type1}
                    export TF_VAR_key_name=${key_name}
                    export TF_VAR_ec2_instance_name=${ec2_instance_name}
                   
                    export TF_VAR_public_key=${public_key}
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
