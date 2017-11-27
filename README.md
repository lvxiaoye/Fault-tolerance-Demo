#Systems
##/flink-0.9-SNAPSHOT 
Modified flink system which has implemented the algorithms mentioned in the papers

##procrustes-flink-1.0-SNAPSHOT.jar
includes the pagerank, connected compoents and k-means implementations on Flink

##/hadoop-2.4.1
Only use the HDFS to save the checkpoints. 

##/spark-1.3.1-bin-hadoop2.6
Only use spark to generate input dataset for K-Means 

##/Scripts
Shell scripts to drive the experiments (please ignore peel-xml)

#Flink configuration
*taskmanager.tmp.dirs*: the process id for jobmanager or taskmanager might be saved here
*taskmanager.checkpoint.dir*: hdfs to save checkpoint

#To submit jobs
##pagerank
/…/flink-0.9-SNAPSHOT/bin/flink run -v -c eu.stratosphere.procrustes.experiments.recovery.PageRank ${app.path.jobs}/procrustes-flink-1.0.SNAPSHOT.jar ${system.hadoop-2.path.input}/input ${system.hadoop-2.path.output}/output *#(iteration)* *#(checkpoint interval)*

##Connected components
/…/flink-0.9-SNAPSHOT/bin/flink run -v -c eu.stratosphere.procrustes.experiments.recovery.ConnectedComponentsBulk ${app.path.jobs}/procrustes-flink-1.0.SNAPSHOT.jar ${system.hadoop-2.path.input}/webbase-raw ${system.hadoop-2.path.output}/concomp *#(iteration)* *#(checkpoint interval)*

##K-Means
/…/flink-0.9-SNAPSHOT/bin/flink run -v -c eu.stratosphere.procrustes.experiments.recovery.KMeansPureTuple /…/procrustes-flink-1.0-SNAPSHOT.jar hdfs://… /input/points hdfs://…/input/centroid hdfs://…/output *#(iteration)* *#(checkpoint interval)*