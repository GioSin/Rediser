Rediser
=======

Creates and manages multiple Redis instances. Stores instance configuration in /var/redis/conf/instances.

Run create.sh script providing a unique instance name and port as separate params.

  Example:

    ./create.sh kickpuncher 1234

Run launch.sh script providing instance name to launch instance. Leave blank to launch all existing instances.

  Example:

    ./launch.sh kickpuncher

    Launching Redis instances:

      kickpuncher

    Done launching Redis instances.
