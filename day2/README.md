## Lab - Deploying C++ application binary artifacts to JFrog Artifactory

Assuming you have already installed Docker community edition, run the below command
```
docker run -d \                      
  --name artifactory \
  -p 8081:8081 \
  -v jfrog-artifactory-data:/var/opt/jfrog/artifactory \
  releases-docker.jfrog.io/jfrog/artifactory-oss:7.77.5

docker ps
docker logs -f artifactory

# Find IP address of your container
docker inspect artficatory | grep IPA
```

You can access the JFrog artifactory from your web browser at url
```
http://172.17.0.3:8082/ui/login
```
Login credentials
<pre>
username - admin
password - password
</pre>

Change password when JFrog prompts to
<pre>
username - admin
password - Admin@12345
</pre>

In JFrog Artifactory, you need to create a Local Repository with Generic type, also create a API key for your JFrog user(admin or any other user you configured).

Let's navigate to the lab exercise folder
```
cd ~/bazel-jan-2026
git pull
cd day2/bazel-jfrog-integration
cat 
export JFROG_USER=admin
export JFROG_API_KEY=<PASTE-YOUR-JFROG-API-KEY-HERE>
./release.sh
```

<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/dd8dc412-b857-43fc-a70e-a891ea21ac97" />
<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/19d1dbbb-95cc-47bd-ad23-7fddf68bbc8c" />
<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/9edcb5aa-8407-4e7f-9206-afa0f41ca45d" />
<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/d98403f1-46ec-420c-90f4-446ad274ad30" />
<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/89ce94c7-f255-49a4-8871-a4ad8bbedda9" />
