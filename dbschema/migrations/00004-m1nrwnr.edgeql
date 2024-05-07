CREATE MIGRATION m1nrwnra7aspcoluf7qfa2icuse2yuv6anipp2nzxjarqkwisq4afa
    ONTO m1pgspnqllx3ci6tvjxxvqxoddcsrhvub2v3oprzqhr2odyrhp4l2a
{
  ALTER TYPE default::User {
      CREATE MULTI LINK posts: default::Post;
  };
};
