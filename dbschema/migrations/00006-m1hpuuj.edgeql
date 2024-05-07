CREATE MIGRATION m1hpuujashu5if5otspzykxmbvfl4lzkt2dweciqggrfrw7quvwnfa
    ONTO m1v27n2edtwywgyo65ensw2qvvdpdjglau56j2o7b3us5zafkqf3ma
{
  ALTER TYPE default::User {
      ALTER LINK posts {
          USING (.<author[IS default::Post]);
          RESET CARDINALITY;
          DROP CONSTRAINT std::exclusive;
      };
  };
};
