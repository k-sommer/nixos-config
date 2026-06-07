let
  sommer = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIER2Zmz7z15EIA8hyjpqztE9MvyP8YUfNB5pcWZVRh6H";
  users = [ sommer ];

  lapt-01 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINNIvcGZvhiX2fKwG4tp5EmHhWkFkJ8ZHitWrvIdg04w";
  desk-01 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcGc0wfkeZKGFC6IemDaKV4+601yWbYP2f95R+LUdcz";
  held-01 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAIMsKxHx8W1S3iGazXXFCBLrD+MddGUCaxALV/pCA4t";
  systems = [ lapt-01 desk-01 held-01 ];
in
{
  "secret1.age".publicKeys = systems;
}