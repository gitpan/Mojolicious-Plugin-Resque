
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Mojolicious helper for sending jobs to a Resque queue.",
  "AUTHOR" => "Diego Kuperman <diego\@freekeylabs.com>",
  "BUILD_REQUIRES" => {
    "Mojolicious::Lite" => 0,
    "Redis" => 0,
    "Test::Mojo" => 0,
    "Test::More" => 0,
    "Test::RedisServer" => "0.10",
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Mojolicious-Plugin-Resque",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Mojolicious::Plugin::Resque",
  "PREREQ_PM" => {
    "Mojo::Base" => 0,
    "Resque" => 0,
    "strict" => 0
  },
  "VERSION" => "0.01",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



