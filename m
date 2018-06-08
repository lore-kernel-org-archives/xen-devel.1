From: osstest service owner <osstest-admin@xenproject.org>
Subject: [libvirt bisection] complete build-arm64-libvirt
Date: Fri, 08 Jun 2018 22:35:47 +0000
Message-ID: <E1fRPz1-0007Il-HN@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8247982048138481978=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jpxy=i2=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fRPz5-0001db-NX
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 22:35:51 +0000
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

--===============8247982048138481978==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-arm64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Bug not present: 9b837963c54ac50d7faae63184d32a0fb599d1b0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/123966/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build --summary-out=tmp/123966.bisection-summary --basis-template=123814 --blessings=real,real-bisect libvirt build-arm64-libvirt libvirt-build
Searching for failure / basis pass:
 123876 fail [host=laxton0] / 123814 [host=laxton1] 123575 [host=laxton1] 123456 [host=laxton1] 123391 ok.
Failure / basis pass flights: 123876 / 123391
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 5babc51912f91f196922b4149ce7e90ceafb5f9c d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
Basis pass 57d6df39bd7eb8166fee68f4b6da03c0cb0802bf d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#57d6df39bd7eb8166fee68f4b6da03c0cb0802bf-5babc51912f91f196922b4149ce7e90ceafb5f9c https://git.savannah.gnu.org/git/gnulib.git/#d6397dde2e127e246e3eeb5254a21f42cac783c8-d6397dde2e127e246e3eeb5254a21f42cac783c8 https://gitlab.com/keycodemap/keycodemapdb.git#16e5b0787687d8904dad2c026107409eb9bfcb95-16e5b0787687d8904dad2c026107409eb9bfcb95 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-43139135a8938de44f66333831d3a8655d07663a git://xenbits.xen.org/xen.git#fc5805daef091240cd5fc06634a8bcdb2f3bb843-06f542f8f2e446c01bd0edab51e9450af7f6e05b
Loaded 2001 nodes in revision graph
Searching for test results:
 123391 pass 57d6df39bd7eb8166fee68f4b6da03c0cb0802bf d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
 123456 [host=laxton1]
 123575 [host=laxton1]
 123840 [host=laxton1]
 123814 [host=laxton1]
 123876 fail 5babc51912f91f196922b4149ce7e90ceafb5f9c d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123953 fail d7ca39e0fb7f795d6431a76c73e7828ffded4f2a d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123941 pass 57d6df39bd7eb8166fee68f4b6da03c0cb0802bf d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
 123946 fail 5babc51912f91f196922b4149ce7e90ceafb5f9c d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123952 fail 7d34949b079e9975a8fca54e0d834f1c7d22f339 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123950 pass e50daa633107e27d835fb02464ea29e373453f02 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123957 pass f785aa6c2bd8814ee4282d6ac990b7d7650dfa40 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123951 pass b87dda7549e4bc6dadf8d3110afcc9e2d2866f7f d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123956 pass 620a1c6a2a60facdeb78a33f7ba2f94639938b27 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123955 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123960 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123958 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123961 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123962 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123964 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123966 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
Searching for interesting versions
 Result found: flight 123391 (pass), for basis pass
 Result found: flight 123876 (fail), for basis failure
 Repro found: flight 123941 (pass), for basis pass
 Repro found: flight 123946 (fail), for basis failure
 0 revisions at 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
No revisions left to test, checking graph state.
 Result found: flight 123958 (pass), for last pass
 Result found: flight 123960 (fail), for first failure
 Repro found: flight 123961 (pass), for last pass
 Repro found: flight 123962 (fail), for first failure
 Repro found: flight 123964 (pass), for last pass
 Repro found: flight 123966 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Bug not present: 9b837963c54ac50d7faae63184d32a0fb599d1b0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/123966/


  commit 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Author: Michal Privoznik <mprivozn@redhat.com>
  Date:   Mon Jun 4 06:51:50 2018 +0200
  
      configure: Require GnuTLS
      
      We are building with GnuTLS everywhere because GnuTLS is widely
      available. Also, it is desirable to prefer cryptographically
      strong PRNG over "/dev/urandom" which is just a fallback.
      
      Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

pnmtopng: 220 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
123966: tolerable ALL FAIL

flight 123966 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/123966/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-arm64-libvirt                                          fail    


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



--===============8247982048138481978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8247982048138481978==--
