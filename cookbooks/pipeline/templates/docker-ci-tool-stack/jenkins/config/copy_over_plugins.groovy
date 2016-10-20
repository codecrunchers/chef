import hudson.model.*;
import jenkins.model.*;

new AntBuilder().copy( todir:'/var/jenkins_home/plugins' ) {
  fileset( dir:'/tmp/plugins' )
}
println "--> setup new plugins... done"

