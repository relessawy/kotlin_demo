oc delete project tests2i  

 oc new-project tests2i 

 oc apply -f imagestream.yaml

 oc apply -f buildconfig.yaml

  oc start-build java21-s2i   

  oc new-app java21-s2i~https://github.com/relessawy/kotlin_demo --strategy=source --name=java21demo-app --allow-missing-imagestream-tags