From: osstest service owner <osstest-admin@xenproject.org>
Subject: [libvirt bisection] complete build-i386-libvirt
Date: Thu, 16 Aug 2018 19:50:32 +0000
Message-ID: <E1fqOHw-0006BY-Af@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6828205666354573323=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xtga=k7=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fqOI0-00009J-Pl
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 19:50:36 +0000
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

--===============6828205666354573323==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-i386-libvirt
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126006/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-i386-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build --summary-out=tmp/126006.bisection-summary --basis-template=123814 --blessings=real,real-bisect libvirt build-i386-libvirt libvirt-build
Searching for failure / basis pass:
 125903 fail [host=debina1] / 123814 [host=fiano1] 123575 [host=fiano1] 123456 [host=debina0] 123391 ok.
Failure / basis pass flights: 125903 / 123391
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b0451117b399df8107340dee8b653cb48e8da1c8 68df637b5f1b5c10370f6981d2a43a5cf74368df 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 1f7574763cbb2c85825b8cc4d81f386e767a476f
Basis pass 57d6df39bd7eb8166fee68f4b6da03c0cb0802bf d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#57d6df39bd7eb8166fee68f4b6da03c0cb0802bf-b0451117b399df8107340dee8b653cb48e8da1c8 https://git.savannah.gnu.org/git/gnulib.git/#d6397dde2e127e246e3eeb5254a21f42cac783c8-68df637b5f1b5c10370f6981d2a43a5cf74368df https://gitlab.com/keycodemap/keycodemapdb.git#16e5b0787687d8904dad2c026107409eb9bfcb95-16e5b0787687d8904dad2c026107409eb9bfcb95 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-43139135a8938de44f66333831d3a8655d07663a git://xenbits.xen.org/xen.git#fc5805daef091240cd5fc06634a8bcdb2f3bb843-1f7574763cbb2c85825b8cc4d81f386e767a476f
Loaded 3358 nodes in revision graph
Searching for test results:
 123391 pass 57d6df39bd7eb8166fee68f4b6da03c0cb0802bf d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
 123373 [host=debina0]
 123416 [host=debina0]
 123456 [host=debina0]
 123575 [host=fiano1]
 123840 [host=debina0]
 123814 [host=fiano1]
 123876 fail irrelevant
 123922 [host=debina0]
 123904 [host=debina0]
 123924 pass 57d6df39bd7eb8166fee68f4b6da03c0cb0802bf d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
 123906 [host=debina0]
 123934 fail irrelevant
 123925 fail irrelevant
 123908 [host=debina0]
 123916 [host=debina0]
 123926 pass irrelevant
 123917 [host=debina0]
 123927 pass irrelevant
 123902 [host=debina0]
 123918 [host=debina0]
 123938 pass irrelevant
 123920 [host=debina0]
 123921 [host=debina0]
 123928 fail irrelevant
 123930 fail irrelevant
 123931 fail irrelevant
 123935 pass irrelevant
 123929 [host=debina0]
 123981 [host=debina0]
 124034 fail irrelevant
 124060 [host=debina0]
 124095 fail irrelevant
 124159 [host=debina0]
 124188 fail irrelevant
 124208 [host=debina0]
 124239 fail irrelevant
 124404 fail irrelevant
 124312 [host=debina0]
 124367 [host=debina0]
 124438 [host=debina0]
 124489 [host=debina0]
 124580 fail irrelevant
 124879 [host=debina0]
 124939 [host=debina0]
 124906 [host=debina0]
 125086 fail irrelevant
 125035 [host=debina0]
 124987 fail irrelevant
 125055 fail irrelevant
 125179 fail irrelevant
 125154 fail irrelevant
 125300 [host=debina0]
 125262 [host=debina0]
 125428 fail irrelevant
 125504 fail irrelevant
 125490 [host=debina0]
 125552 fail irrelevant
 125517 fail irrelevant
 125586 fail irrelevant
 125653 [host=debina0]
 125647 fail irrelevant
 125638 fail irrelevant
 125668 fail irrelevant
 125692 fail 6f9fb4fa0118a0645905a6c8095d3476ca6c5ef4 68df637b5f1b5c10370f6981d2a43a5cf74368df 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a acd00a303378ce48bd6bbd8a579f1fe2f1b21a7d
 125903 fail b0451117b399df8107340dee8b653cb48e8da1c8 68df637b5f1b5c10370f6981d2a43a5cf74368df 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 1f7574763cbb2c85825b8cc4d81f386e767a476f
 125947 fail b0451117b399df8107340dee8b653cb48e8da1c8 68df637b5f1b5c10370f6981d2a43a5cf74368df 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 1f7574763cbb2c85825b8cc4d81f386e767a476f
 125958 fail f7ac4f7ee508b66c7e76b818377fcc222daad5b5 0ee5212efa5434e5bc837660fbf2facbdeb39952 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a b4ac4bc410222d221dc46a74ac71efaa7b32d57c
 125989 fail fc06debd0c6348c8d27fb8eb5989ebf0528d7103 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 125960 fail 3593d36c3399c2d990b2db95d81452af8bc7cd6d 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 125997 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 125991 pass f785aa6c2bd8814ee4282d6ac990b7d7650dfa40 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 125927 pass 57d6df39bd7eb8166fee68f4b6da03c0cb0802bf d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
 126001 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 125992 fail fe9f235a4cb037628b80039e7c9ee5342cda745d 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 125965 pass f3d960391cd8250e9d33535fdc497af753a2997d 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 3960f3a52346348e6b0306f65d19375612bd35b9
 125968 pass 29592788f1afac8b239f751fd5a861ed4d58b62d 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 3960f3a52346348e6b0306f65d19375612bd35b9
 125969 fail ff907a46dd8a8464f0d00e0284c8ad3c9ce6ada5 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126004 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 125999 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 125993 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126005 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126006 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
Searching for interesting versions
 Result found: flight 123391 (pass), for basis pass
 Result found: flight 125903 (fail), for basis failure
 Repro found: flight 125927 (pass), for basis pass
 Repro found: flight 125947 (fail), for basis failure
 0 revisions at 9b837963c54ac50d7faae63184d32a0fb599d1b0 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
No revisions left to test, checking graph state.
 Result found: flight 125997 (pass), for last pass
 Result found: flight 125999 (fail), for first failure
 Repro found: flight 126001 (pass), for last pass
 Repro found: flight 126004 (fail), for first failure
 Repro found: flight 126005 (pass), for last pass
 Repro found: flight 126006 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Bug not present: 9b837963c54ac50d7faae63184d32a0fb599d1b0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126006/


  commit 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Author: Michal Privoznik <mprivozn@redhat.com>
  Date:   Mon Jun 4 06:51:50 2018 +0200
  
      configure: Require GnuTLS
      
      We are building with GnuTLS everywhere because GnuTLS is widely
      available. Also, it is desirable to prefer cryptographically
      strong PRNG over "/dev/urandom" which is just a fallback.
      
      Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.409035 to fit
pnmtopng: 48 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
126006: tolerable ALL FAIL

flight 126006 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/126006/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build           fail baseline untested


jobs:
 build-i386-libvirt                                           fail    


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



--===============6828205666354573323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6828205666354573323==--
