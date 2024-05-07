CREATE MIGRATION m1v27n2edtwywgyo65ensw2qvvdpdjglau56j2o7b3us5zafkqf3ma
    ONTO m1nrwnra7aspcoluf7qfa2icuse2yuv6anipp2nzxjarqkwisq4afa
{
  ALTER TYPE default::User {
      ALTER LINK posts {
          CREATE CONSTRAINT std::exclusive;
      };
  };
};
