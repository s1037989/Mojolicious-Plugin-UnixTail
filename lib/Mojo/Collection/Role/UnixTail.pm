package Mojo::Collection::Role::UnixTail;
use Mojo::Base -strict, -role;

sub unix_tail {
  my ($self, $size) = @_;
  $size = -1 * $size if $size =~ /^[\+-]/;
  return $self->new(@$self)                                     if $size > @$self;
  return $self->new(@$self[($#$self - ($size - 1)) .. $#$self]) if $size >= 0;
  return $self->new(@$self[(abs($size) -1 ) .. $#self])         if substr($size, 0, 1) eq '+';
  return $self->new(@$self[(0 - $size) .. $#$self]);
}

1;