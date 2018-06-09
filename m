From: osstest service owner <osstest-admin@xenproject.org>
Subject: [libvirt bisection] complete build-armhf-libvirt
Date: Sat, 09 Jun 2018 22:55:07 +0000
Message-ID: <E1fRmlH-0006gT-FP@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8230456556006819438=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kbij=i3=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fRmlM-0003OF-3D
 for xen-devel@lists.xenproject.org; Sat, 09 Jun 2018 22:55:12 +0000
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

--===============8230456556006819438==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-armhf-libvirt
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/124026/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-armhf-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-armhf-libvirt.libvirt-build --summary-out=tmp/124026.bisection-summary --basis-template=123814 --blessings=real,real-bisect libvirt build-armhf-libvirt libvirt-build
Searching for failure / basis pass:
 123929 fail [host=arndale-westfield] / 123814 [host=arndale-metrocentre] 123575 [host=cubietruck-picasso] 123456 [host=arndale-metrocentre] 123391 ok.
Failure / basis pass flights: 123929 / 123391
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 13311be4a3fdb7eb501de6e9007eefbb42b84091 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
Basis pass 57d6df39bd7eb8166fee68f4b6da03c0cb0802bf d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#57d6df39bd7eb8166fee68f4b6da03c0cb0802bf-13311be4a3fdb7eb501de6e9007eefbb42b84091 https://git.savannah.gnu.org/git/gnulib.git/#d6397dde2e127e246e3eeb5254a21f42cac783c8-d6397dde2e127e246e3eeb5254a21f42cac783c8 https://gitlab.com/keycodemap/keycodemapdb.git#16e5b0787687d8904dad2c026107409eb9bfcb95-16e5b0787687d8904dad2c026107409eb9bfcb95 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-43139135a8938de44f66333831d3a8655d07663a git://xenbits.xen.org/xen.git#fc5805daef091240cd5fc06634a8bcdb2f3bb843-06f542f8f2e446c01bd0edab51e9450af7f6e05b
Loaded 2001 nodes in revision graph
Searching for test results:
 123391 pass 57d6df39bd7eb8166fee68f4b6da03c0cb0802bf d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
 123456 [host=arndale-metrocentre]
 123575 [host=cubietruck-picasso]
 123840 [host=arndale-metrocentre]
 123814 [host=arndale-metrocentre]
 123876 [host=arndale-lakeside]
 123967 [host=arndale-lakeside]
 123969 [host=arndale-lakeside]
 123929 fail 13311be4a3fdb7eb501de6e9007eefbb42b84091 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123971 [host=arndale-lakeside]
 123973 [host=arndale-lakeside]
 123974 [host=arndale-lakeside]
 123975 [host=arndale-lakeside]
 124001 pass 8981c750b111c8a549a888d066f5e5c736787326 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 124019 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123978 pass 57d6df39bd7eb8166fee68f4b6da03c0cb0802bf d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
 124005 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 124025 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123983 fail 13311be4a3fdb7eb501de6e9007eefbb42b84091 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 124026 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123988 pass 0b9451f9d602f061ff1b81127863375883c95999 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 124007 pass 620a1c6a2a60facdeb78a33f7ba2f94639938b27 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123991 fail 7cef131efea7e17af826ffd7dfcad15ebcacc77e d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123996 pass 4e9d0ad7a0b2c1a4c28f1c634d42ae329ce22445 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 124011 pass f785aa6c2bd8814ee4282d6ac990b7d7650dfa40 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 124015 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 124016 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 124017 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
Searching for interesting versions
 Result found: flight 123391 (pass), for basis pass
 Result found: flight 123929 (fail), for basis failure
 Repro found: flight 123978 (pass), for basis pass
 Repro found: flight 123983 (fail), for basis failure
 0 revisions at 9b837963c54ac50d7faae63184d32a0fb599d1b0 d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
No revisions left to test, checking graph state.
 Result found: flight 124015 (pass), for last pass
 Result found: flight 124016 (fail), for first failure
 Repro found: flight 124017 (pass), for last pass
 Repro found: flight 124019 (fail), for first failure
 Repro found: flight 124025 (pass), for last pass
 Repro found: flight 124026 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Bug not present: 9b837963c54ac50d7faae63184d32a0fb599d1b0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/124026/


  commit 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Author: Michal Privoznik <mprivozn@redhat.com>
  Date:   Mon Jun 4 06:51:50 2018 +0200
  
      configure: Require GnuTLS
      
      We are building with GnuTLS everywhere because GnuTLS is widely
      available. Also, it is desirable to prefer cryptographically
      strong PRNG over "/dev/urandom" which is just a fallback.
      
      Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

pnmtopng: 206 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-armhf-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
124026: tolerable ALL FAIL

flight 124026 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/124026/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-armhf-libvirt                                          fail    


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



--===============8230456556006819438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8230456556006819438==--
