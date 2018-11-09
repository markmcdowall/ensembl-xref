=head1 LICENSE

See the NOTICE file distributed with this work for additional information
   regarding copyright ownership.
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

=cut

package Bio::EnsEMBL::Xref::Schema::ResultSet::DependentXref;
use strict;
use warnings;

use parent 'DBIx::Class::ResultSet';

sub fetch_dependent_xref {
  my ($self,$direct_accession,$dependent_accession) = @_;

  my $hit = $self->find({
      'master_xref.accession' => $direct_accession,
      'dependent_xref.accession' => $dependent_accession
    }, {
      join => [ 'master_xref','dependent_xref']
    });
  
  return $hit;
}

1;
