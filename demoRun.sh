#! /bin/bash
# demoRun.sh

#cd /home/yezi/flink-0.9
#start-dfs.sh
#sleep 20
#start-cluster.sh
#sleep 10
mkdir ~/Fault-tolerance-Demo/ExecutionPlan
jps |awk '$2 == "TaskManager" {print $1"\t"$2}' | tee ~/Fault-tolerance-Demo/pids
bin/flink info -v -c eu.stratosphere.procrustes.experiments.recovery.ConnectedComponentsBulk ~/Fault-tolerance-Demo/procrustes-flink-1.0-SNAPSHOT.jar hdfs://localhost:9000/input/cnr-2000-raw hdfs://localhost:9000/concomp 30 10 > ~/Fault-tolerance-Demo/ExecutionPlan/jasonConnectedComponentsBulk
sleep 5
bin/flink info -v -c eu.stratosphere.procrustes.experiments.recovery.ConnectedComponentsBulkLateCpt ~/Fault-tolerance-Demo/procrustes-flink-1.0-SNAPSHOT.jar hdfs://localhost:9000/input/cnr-2000-raw hdfs://localhost:9000/concomp 30 5 > ~/Fault-tolerance-Demo/ExecutionPlan/jasonConnectedComponentsBulkLateCpt
sleep 5
bin/flink info -v -c eu.stratosphere.procrustes.experiments.recovery.PageRank ~/Fault-tolerance-Demo/procrustes-flink-1.0-SNAPSHOT.jar hdfs://localhost:9000/input hdfs://localhost:9000/output 325557 10 5 > ~/Fault-tolerance-Demo/ExecutionPlan/jasonPageRank
sleep 5
bin/flink info -v -c eu.stratosphere.procrustes.experiments.recovery.PageRankLateCpt ~/Fault-tolerance-Demo/procrustes-flink-1.0-SNAPSHOT.jar hdfs://localhost:9000/input hdfs://localhost:9000/output 325557 10 5 > ~/Fault-tolerance-Demo/ExecutionPlan/jasonPageRankLateCpt
sleep 5
bin/flink info -v -c eu.stratosphere.procrustes.experiments.recovery.KMeansPureTuple ~/Fault-tolerance-Demo/procrustes-flink-1.0-SNAPSHOT.jar hdfs://localhost:9000/points hdfs://localhost:9000/centroid hdfs://localhost:9000/output 10 5 > ~/Fault-tolerance-Demo/ExecutionPlan/KMeans
# generate Spark data
#bin/spark-submit --class eu.stratosphere.procrustes.datagen.spark.SparkClusterGenerator ~/Fault-tolerance-Demo/procrustes-datagen-1.0-SNAPSHOT.jar spark://lvye-Lenovo-IdeaPad-01:7077 3 10000 file:///home/yezi/Fault-tolerance-Demo/clusters-D3-K3.csv hdfs://localhost:9000/points
#bin/spark-submit --class eu.stratosphere.procrustes.datagen.spark.SparkClusterGenerator ~/Fault-tolerance-Demo/procrustes-datagen-1.0-SNAPSHOT.jar spark://lvye-Lenovo-IdeaPad-01:7077 3 100 file:///home/yezi/Fault-tolerance-Demo/clusters-D3-K3.csv hdfs://localhost:9000/centroid
