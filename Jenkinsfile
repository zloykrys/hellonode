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
    stage('Send data to Splunk') {
	//send job metadata and junit reports with page size set to 50 (each event contains max 50 test cases)
	splunkins.sendTestReport(50)
	//send coverage, each event contains max 50 class metrics
	splunkins.sendCoverageReport(50)
	//send all logs from workspace to splunk, with each file size limits to 10MB
	splunkins.archive("**/*.log **/*.json", null, false, "10MB")
    	// splunkins.archive("**/*.json", null, false, "10MB")
    }

}
