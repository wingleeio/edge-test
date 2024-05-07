CREATE MIGRATION m1pgspnqllx3ci6tvjxxvqxoddcsrhvub2v3oprzqhr2odyrhp4l2a
    ONTO m1fxxhdhd72j2w57qlw5tobubaka7zcm3tpohgdeekozfbp6spalxa
{
  CREATE TYPE default::User {
      CREATE REQUIRED PROPERTY name: std::str;
  };
  CREATE TYPE default::Post {
      CREATE REQUIRED LINK author: default::User;
      CREATE REQUIRED PROPERTY body: std::str;
      CREATE REQUIRED PROPERTY title: std::str;
  };
};
