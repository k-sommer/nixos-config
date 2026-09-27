let
  sommer = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIER2Zmz7z15EIA8hyjpqztE9MvyP8YUfNB5pcWZVRh6H";
  users = [ sommer ];

  lapt-01 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINNIvcGZvhiX2fKwG4tp5EmHhWkFkJ8ZHitWrvIdg04w";
  desk-01 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcGc0wfkeZKGFC6IemDaKV4+601yWbYP2f95R+LUdcz";
  desk-02 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK1QsUvrkTEvk+a3jLP4qDCDwvuw4GPFKgxoVZoWMHAs";
  held-01 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILoKPc18omUtmsM+QOJyV+99YzuaspKeTNZJWjQG9ENe";
  systems = [ lapt-01 desk-01 desk-02 held-01 ];
in
{
  "secret1.age".publicKeys = systems ++ users;
}
