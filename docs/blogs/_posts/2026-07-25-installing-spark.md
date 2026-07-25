---
layout: post
title: "Installing Spark"
date: 2026-07-25
description: "Step-by-step guide to installing Apache Spark on macOS and GitHub Codespaces using PySpark and uv."
last_modified_at: 2026-07-25
tags: [PySpark, Spark, Installation, Data Engineering, Big Data]
---

*July 25, 2026*

# Installing Spark

## Table of Contents
- [Installing on macOS](#installing-on-macos)
- [Installing on GitHub Codespaces](#installing-on-github-codespaces)

---

## Installing on macOS

Required : pycharm

I had already installed pycharm on my mac so, I am proceeding with creation of project

1. Open pycharm and Click on New PyCharm project

![PyCharm new project](/blogs/images/spark_install_1.png)

2. Select the project location. Under Interpreter Type, choose Custom Environment. For Environment, select Generate New, choose uv as the environment type, and leave the remaining settings at their default values.

![PyCharm interpreter settings](/blogs/images/spark_install_2.png)

3. Install java using homebrew as spark 4 requires Java17 

open terminal app

```bash
brew install openjdk@17
```

![Install openjdk via brew](/blogs/images/spark_install_3.png)

4. For the system Java wrappers to find this JDK, symlink it with

```bash

sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
```

5. Add the following environment variables to your `.zshrc` (or `.bash_profile`):

```
export JAVA_HOME=$(brew --prefix openjdk@17)
export PATH="$JAVA_HOME/bin:$PATH"
```

![Java environment variables](/blogs/images/spark_install_java_env.png)

6. check the java version 

```bash
java --version
```

output will be 

![Java version output](/blogs/images/spark_install_java_version.png)

7. Lets install Pyspark, come back to pycharm and open its terminal and run 

```bash
uv add pyspark
```

8. Open the `pyproject.toml` file. You will see that `pyspark` has been added. 

![pyproject.toml with pyspark](/blogs/images/spark_install_4.png)

9. Create a sample test script

```bash
#test_pyspark.py
import pyspark
from pyspark.sql import SparkSession
spark = (
    SparkSession.builder
    .appName("test")
    .master("local[*]")
    .getOrCreate()
)
print(f"Spark version: {spark.version}")
print(spark.sparkContext.uiWebUrl)
df = spark.range(100_000_000)
print(df.count())
input("Press Enter...")
```

10. Go to link url to see spark ui and jobs

![Spark UI](/blogs/images/spark_install_5.png)

![Spark UI jobs](/blogs/images/spark_install_6.png)

## Installing on GitHub Codespaces

check if java is installed already

```bash
java —version
```

output :

```markdown
openjdk 25.0.2 2026-01-20 LTS
OpenJDK Runtime Environment Microsoft-13053558 (build 25.0.2+10-LTS)
OpenJDK 64-Bit Server VM Microsoft-13053558 (build 25.0.2+10-LTS, mixed mode, sharing)
```

If java is not present  and then check java version

```markdown
sudo apt update
sudo apt install default-jdk
```

set java path

```bash
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java)))) -- Many applications don't just need to run java; they need to know where the entire Java installation is located.
export PATH="${JAVA_HOME}/bin:${PATH}"  
```

Without updating `PATH`, you might have to run Java like this:

```
/usr/lib/jvm/java-17-openjdk-amd64/bin/java-version
```

With `PATH` updated, you can simply type:

```
java --version
```

Install pyspark using [uv](https://docs.astral.sh/uv/getting-started/installation/#installation-methods) installation guide by [me](https://nshravanreddy.github.io/blogs/2025/01/28/uv/)

```bash
uv init
uv add pyspark
```

```python
#test_pyspark.py
from pyspark.sql import SparkSession
spark = (
    SparkSession.builder
    .appName("test")
    .master("local[1]")
    .getOrCreate()
)
df = spark.range(100_000_000)
print(df.count())
input("Press Enter...")
```

use this code to see job 

```python
#test_pyspark.py
import pyspark
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName('test') \
    .getOrCreate()

print(f"Spark version: {spark.version}")

df = spark.range(10)
df.show()
```

Run:

uv run python test_pyspark.py

When the Spark application starts, GitHub Codespaces will prompt you to forward the Spark UI port.

Open the forwarded port (usually 4040. If another Spark application is already running, Spark may use 4041, 4042, and so on).

Once opened, you can monitor the Spark application through the Spark UI by viewing Jobs, Stages, SQL, Executors, Environment, and Storage.

Installing Spark locally is recommended for learning and experimentation. If you prefer not to, that's fine — you can use Databricks to execute Spark jobs, though you'll have limitations compared to a local setup.


You can also read this article on:
🌐 [Personal Blog](https://nshravanreddy.github.io/blogs/2026/07/25/installing-spark/)
📝 [Notion](https://nsr6.notion.site/Installing-Spark-3a805b97e27e80b4ac32ee003f0125cd?source=copy_link)