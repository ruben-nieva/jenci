oc delete project jenci
sleep 5 
oc new-project jenci --display-name="CI/CD"
oc policy add-role-to-user edit -z default -n jenci
oc create -f jenkins-master-s2i-template.yaml
oc create -f jenkins-slave-builder-template.yaml

echo "Creating new application based on template"
oc new-app --template=jenkins-slave-builder
