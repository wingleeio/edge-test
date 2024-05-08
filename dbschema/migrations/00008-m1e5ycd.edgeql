CREATE MIGRATION m1e5ycddes5fmlmzzeskyx7yem56nijf5vcowx4qsolui2r4gb7taa
    ONTO m17hwxy3qopmm66xv2hiqxkdnec7s5i6hyzpbeynjnnmjmemthaaka
{
  ALTER TYPE default::Node {
      ALTER PROPERTY updated_at {
          SET default := (std::datetime_current());
      };
  };
};
