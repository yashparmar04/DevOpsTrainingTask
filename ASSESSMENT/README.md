**Assignment**


**Use Case Scenario**

Your company is developing a new e-commerce application consisting of
several

microservices: a front-end service, a product catalog service, and an
order processing

service. The goal is to automate the deployment and configuration of
these services across development, testing, and production environments
using Ansible, Docker, Kubernetes, and

Jenkins.

-   **Frontend yml file**

![](.//media/image1.png)
**production yml file**
-   ![](.//media/image2.png)

-   **testing yml file**

![](.//media/image3.png)

**ingress.yml file**



![](.//media/image4.png)


-   **build and push image frontend**



![](.//media/image5.png)![](.//media/image6.png)


-   **build and push image testing**

![](.//media/image7.png)


-   **build and push image production**



![](.//media/image8.png)

![](.//media/image9.png)

-   **Dockerfile**

![](.//media/image10.png)


**Docker Pushed images**



-   **testing image**

![](.//media/image11.png)

-   **Prod image**

![](.//media/image12.png)


-   **frontend image**

![](.//media/image13.png)



**Output**

-   **testing deploymnet**

![](.//media/image14.png)

-   **frontend deployment**

![](.//media/image15.png)

**production deployment**

-   ![](.//media/image16.png)


