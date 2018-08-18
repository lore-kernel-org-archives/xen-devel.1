From: osstest service owner <osstest-admin@xenproject.org>
Subject: [libvirt bisection] complete build-amd64-libvirt
Date: Sat, 18 Aug 2018 18:24:06 +0000
Message-ID: <E1fr5tO-0005Ln-Md@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6288788758601829662=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xo0w=lb=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fr5tR-0003zO-Rp
 for xen-devel@lists.xenproject.org; Sat, 18 Aug 2018 18:24:09 +0000
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

--===============6288788758601829662==
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126175/


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
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build --summary-out=tmp/126175.bisection-summary --basis-template=123814 --blessings=real,real-bisect libvirt build-amd64-libvirt libvirt-build
Searching for failure / basis pass:
 125925 fail [host=godello1] / 123814 ok.
Failure / basis pass flights: 125925 / 123814
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest bfd91dc0c40019c4b543bb704a7391faca0e1bc8 68df637b5f1b5c10370f6981d2a43a5cf74368df 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 1f7574763cbb2c85825b8cc4d81f386e767a476f
Basis pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#076a2b409667dd9f716a2a2085e1ffea9d58fe8b-bfd91dc0c40019c4b543bb704a7391faca0e1bc8 https://git.savannah.gnu.org/git/gnulib.git/#d6397dde2e127e246e3eeb5254a21f42cac783c8-68df637b5f1b5c10370f6981d2a43a5cf74368df https://gitlab.com/keycodemap/keycodemapdb.git#16e5b0787687d8904dad2c026107409eb9bfcb95-16e5b0787687d8904dad2c026107409eb9bfcb95 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-43139135a8938de44f66333831d3a8655d07663a git://xenbits.xen.org/xen.git#06f542f8f2e446c01bd0edab51e9450af7f6e05b-1f7574763cbb2c85825b8cc4d81f386e767a476f
Loaded 3358 nodes in revision graph
Searching for test results:
 123840 [host=huxelrebe0]
 123814 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 123876 [host=huxelrebe0]
 123889 [host=huxelrebe0]
 123890 [host=huxelrebe0]
 123891 [host=huxelrebe0]
 123866 [host=huxelrebe0]
 123892 [host=huxelrebe0]
 123895 [host=huxelrebe0]
 123868 [host=huxelrebe0]
 123896 [host=huxelrebe0]
 123878 [host=huxelrebe0]
 123882 [host=huxelrebe0]
 123883 [host=huxelrebe0]
 123885 [host=huxelrebe0]
 123899 [host=huxelrebe0]
 123901 [host=huxelrebe0]
 123929 [host=huxelrebe1]
 123981 [host=huxelrebe0]
 124034 [host=huxelrebe1]
 124060 [host=huxelrebe1]
 124095 [host=huxelrebe0]
 124159 [host=huxelrebe1]
 124188 [host=huxelrebe0]
 124208 [host=huxelrebe1]
 124239 [host=huxelrebe1]
 124404 [host=huxelrebe1]
 124312 [host=huxelrebe0]
 124367 [host=huxelrebe1]
 124438 [host=huxelrebe0]
 124489 [host=huxelrebe1]
 124580 [host=huxelrebe0]
 124879 [host=huxelrebe0]
 124939 [host=huxelrebe0]
 124906 [host=huxelrebe0]
 125086 [host=godello0]
 125035 [host=godello0]
 124987 [host=huxelrebe0]
 125055 fail irrelevant
 125179 [host=godello0]
 125154 fail irrelevant
 125300 [host=godello0]
 125262 [host=godello0]
 125428 [host=godello0]
 125504 [host=huxelrebe1]
 125490 [host=godello0]
 125552 [host=godello0]
 125517 [host=huxelrebe1]
 125586 fail irrelevant
 125653 [host=godello0]
 125647 fail irrelevant
 125638 fail irrelevant
 125668 [host=godello0]
 125692 [host=godello0]
 125903 [host=huxelrebe1]
 125925 fail bfd91dc0c40019c4b543bb704a7391faca0e1bc8 68df637b5f1b5c10370f6981d2a43a5cf74368df 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 1f7574763cbb2c85825b8cc4d81f386e767a476f
 126007 [host=huxelrebe1]
 126014 [host=huxelrebe1]
 126018 [host=huxelrebe1]
 126022 [host=huxelrebe1]
 126026 [host=huxelrebe1]
 126041 [host=huxelrebe1]
 126067 [host=huxelrebe1]
 126044 [host=huxelrebe1]
 126070 [host=huxelrebe1]
 126047 [host=huxelrebe1]
 126052 [host=huxelrebe1]
 126056 [host=huxelrebe1]
 126057 [host=huxelrebe1]
 126072 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 06f542f8f2e446c01bd0edab51e9450af7f6e05b
 126058 [host=huxelrebe1]
 126059 [host=huxelrebe1]
 126060 [host=huxelrebe1]
 126091 pass 88860bb9d98ac00a31b335f843915c0401ee0d66 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 3960f3a52346348e6b0306f65d19375612bd35b9
 126079 fail bfd91dc0c40019c4b543bb704a7391faca0e1bc8 68df637b5f1b5c10370f6981d2a43a5cf74368df 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 1f7574763cbb2c85825b8cc4d81f386e767a476f
 126065 [host=huxelrebe1]
 126087 fail f7ac4f7ee508b66c7e76b818377fcc222daad5b5 0ee5212efa5434e5bc837660fbf2facbdeb39952 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a b4ac4bc410222d221dc46a74ac71efaa7b32d57c
 126089 fail cb9868b5212674058662b5cdca7496b7639922e0 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 11535cdbc0ae5925a55b3e735447c30faaa6f63b
 126105 fail 30fb2276d88b275dc2aad6ddd28c100d944b59a5 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126122 pass f3f7cb73b9b0b77d087c8159810ac4acb62ebf96 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 3960f3a52346348e6b0306f65d19375612bd35b9
 126106 pass 8ac8301366f4f04bd566be9e0e8209530d16d2f9 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 3960f3a52346348e6b0306f65d19375612bd35b9
 126124 pass 620a1c6a2a60facdeb78a33f7ba2f94639938b27 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 3960f3a52346348e6b0306f65d19375612bd35b9
 126147 fail 4f15e75a9abe7b01157a767255ee69135a527824 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126175 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126153 pass f785aa6c2bd8814ee4282d6ac990b7d7650dfa40 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126156 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126158 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126161 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126166 fail 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
 126173 pass 9b837963c54ac50d7faae63184d32a0fb599d1b0 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
Searching for interesting versions
 Result found: flight 123814 (pass), for basis pass
 Result found: flight 125925 (fail), for basis failure
 Repro found: flight 126072 (pass), for basis pass
 Repro found: flight 126079 (fail), for basis failure
 0 revisions at 9b837963c54ac50d7faae63184d32a0fb599d1b0 7ff7a27a8a988a5aa058ce29e1e219e4fa75940f 16e5b0787687d8904dad2c026107409eb9bfcb95 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 35fcb982ea16c40619fee8bba4789a94d824521e
No revisions left to test, checking graph state.
 Result found: flight 126156 (pass), for last pass
 Result found: flight 126158 (fail), for first failure
 Repro found: flight 126161 (pass), for last pass
 Repro found: flight 126166 (fail), for first failure
 Repro found: flight 126173 (pass), for last pass
 Repro found: flight 126175 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Bug not present: 9b837963c54ac50d7faae63184d32a0fb599d1b0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126175/


  commit 60d9ad6f1e42618fce10baeb0f02c35e5ebd5b24
  Author: Michal Privoznik <mprivozn@redhat.com>
  Date:   Mon Jun 4 06:51:50 2018 +0200
  
      configure: Require GnuTLS
      
      We are building with GnuTLS everywhere because GnuTLS is widely
      available. Also, it is desirable to prefer cryptographically
      strong PRNG over "/dev/urandom" which is just a fallback.
      
      Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.411444 to fit
pnmtopng: 60 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
126175: tolerable ALL FAIL

flight 126175 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/126175/

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



--===============6288788758601829662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6288788758601829662==--
