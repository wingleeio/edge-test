CREATE MIGRATION m17hwxy3qopmm66xv2hiqxkdnec7s5i6hyzpbeynjnnmjmemthaaka
    ONTO m1hpuujashu5if5otspzykxmbvfl4lzkt2dweciqggrfrw7quvwnfa
{
  CREATE ABSTRACT TYPE default::Node {
      CREATE REQUIRED PROPERTY created_at: std::datetime {
          SET default := (std::datetime_current());
          SET readonly := true;
      };
      CREATE PROPERTY updated_at: std::datetime {
          CREATE REWRITE
              INSERT 
              USING (std::datetime_of_statement());
          CREATE REWRITE
              UPDATE 
              USING (std::datetime_of_statement());
      };
  };
  ALTER TYPE default::Post EXTENDING default::Node LAST;
  ALTER TYPE default::User EXTENDING default::Node LAST;
};
