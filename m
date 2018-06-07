From: osstest service owner <osstest-admin@xenproject.org>
Subject: [libvirt bisection] complete build-amd64-libvirt
Date: Thu, 07 Jun 2018 17:35:12 +0000
Message-ID: <E1fQyoa-0002at-7e@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4486598000952367591=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x5mx=iz=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fQyod-0007Dz-EG
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 17:35:15 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============4486598000952367591==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-amd64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Bug not present: 9b837963c54ac50d7faae63184d32a0fb599d1b0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/123901/


  commit 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Author: Michal Privoznik <mprivozn@redhat.com>
  Date:   Mon Jun 4 06:51:50 2018 +0200
  
      configure: Require GnuTLS
      
      We are building with GnuTLS everywhere because GnuTLS is widely
      available. Also, it is desirable to prefer cryptographically
      strong PRNG over "/dev/urandom" which is just a fallback.
      
      Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build --summary-out=tmp/123901.bisection-summary --basis-template=123814 --blessings=real,real-bisect libvirt build-amd64-libvirt libvirt-build
Searching for failure / basis pass:
 123840 fail [host=huxelrebe0] / 123814 [host=godello1] 123575 ok.
Failure / basis pass flights: 123840 / 123575
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest a9884d70627628f8f0f38fc2b9b99931675b1617 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
Basis pass e36b1f6583324133405c7f4552a9da51e6c61161 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#e36b1f6583324133405c7f4552a9da51e6c61161-a9884d70627628f8f0f38fc2b9b99931675b1617 https://git.savannah.gnu.org/git/gnulib.git/#d6397dde2e127e246e3eeb5254a21f42cac783c8-d6397dde2e127e246e3eeb5254a21f42cac783c8 https://gitlab.com/keycodemap/keycodemapdb.git#16e5b0787687d8904dad2c026107409eb9bfcb95-16e5b0787687d8904dad2c026107409eb9bfcb95 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-43139135a8938de44f66333831d3a8655d07663a git://xenbits.xen.org/xen.git#06f542f8f2e446c01bd0edab51e9450af7f6e05b-06f542f8f2e446c01bd0edab51e9450af7f6e05b
Loaded 1001 nodes in revision graph
Searching for test results:
 123575 pass e36b1f6583324133405c7f4552a9da51e6c61161 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123840 fail a9884d70627628f8f0f38fc2b9b99931675b1617 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123814 [host=godello1]
 123889 fail 3700dd53c3e4890b18b9962955cdf3440dce9746 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123890 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123891 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123866 pass e36b1f6583324133405c7f4552a9da51e6c61161 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123892 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123895 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123868 fail a9884d70627628f8f0f38fc2b9b99931675b1617 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123896 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123878 pass e50daa633107e27d835fb02464ea29e373453f02 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123882 pass 4e9d0ad7a0b2c1a4c28f1c634d42ae329ce22445 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123883 pass f785aa6c2bd8814ee4282d6ac990b7d7650dfa40 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123885 fail 7cef131efea7e17af826ffd7dfcad15ebcacc77e d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123899 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123901 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
Searching for interesting versions
 Result found: flight 123575 (pass), for basis pass
 Result found: flight 123840 (fail), for basis failure
 Repro found: flight 123866 (pass), for basis pass
 Repro found: flight 123868 (fail), for basis failure
 0 revisions at 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
No revisions left to test, checking graph state.
 Result found: flight 123891 (pass), for last pass
 Result found: flight 123892 (fail), for first failure
 Repro found: flight 123895 (pass), for last pass
 Repro found: flight 123896 (fail), for first failure
 Repro found: flight 123899 (pass), for last pass
 Repro found: flight 123901 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Bug not present: 9b837963c54ac50d7faae63184d32a0fb599d1b0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/123901/


  commit 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Author: Michal Privoznik <mprivozn@redhat.com>
  Date:   Mon Jun 4 06:51:50 2018 +0200
  
      configure: Require GnuTLS
      
      We are building with GnuTLS everywhere because GnuTLS is widely
      available. Also, it is desirable to prefer cryptographically
      strong PRNG over "/dev/urandom" which is just a fallback.
      
      Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Revision graph left in /home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
123901: tolerable ALL FAIL

flight 123901 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/123901/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-amd64-libvirt                                          fail    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary



--===============4486598000952367591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4486598000952367591==--
