node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
	script {
	   env.DOCKER_HOST='unix:$XDG_RUNTIME_DIR/podman/podman.sock'
	}

        app = docker.build("hellonode")
    }
    stage('Scan local image') {
	script {
	   env.DOCKER_HOST='unix:$XDG_RUNTIME_DIR/podman/podman.sock'
	}
	neuvector registrySelection: 'Local', repository: 'jenkins/hellonode', tag: 'latest', controllerEndpointUrlSelection: 'controller'
    }

    splunkins.archive("**/*.log", null, false, "10MB")
}
