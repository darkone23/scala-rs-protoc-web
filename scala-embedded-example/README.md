using scala assembly tools to ship onejar

use scala to define java interface

```sh
devenv shell # or direnv allow

# to run the main method via sbt
just run

# to build the assembly
just assembly

# to build and run
just run-assembly
```

some technologies included in this example:

- [sbt-assembly](https://github.com/sbt/sbt-assembly) jar shading magic for scala
- [scalapb](https://github.com/scalapb/ScalaPB) protobufs for scala
