node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("hellonode")
    }
    stage('Scan local image') {
	neuvector registrySelection: 'Local', repository: 'hellonode', tag: 'latest', controllerEndpointUrlSelection: '', standaloneScanner: 'True', scanLayers: 'True'
    }

    splunkins.archive("**/*.json", null, false, "1000MB")
}
