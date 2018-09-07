From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus bisection] complete
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow
Date: Fri, 07 Sep 2018 06:44:37 +0000
Message-ID: <E1fyAVR-0004XZ-Cv@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1354567546920126349=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jw07=lv=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fyAVV-0001FZ-12
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 06:44:41 +0000
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

--===============1354567546920126349==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow
testid debian-hvm-install

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  580c458699e367bf427967844fa79086b60da675
  Bug not present: 6425f91c72525295a551bf148d9a6b0fa7971097
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127362/


  commit 580c458699e367bf427967844fa79086b60da675
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Mon Mar 19 16:50:46 2018 +0000
  
      xen/domain: Call arch_domain_create() as early as possible in domain_create()
      
      This is in preparation to set up d->max_cpus and d->vcpu[] in domain_create(),
      and allow later parts of domain construction to have access to the values.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-linus/test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-linus/test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow.debian-hvm-install --summary-out=tmp/127362.bisection-summary --basis-template=125898 --blessings=real,real-bisect linux-linus test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow debian-hvm-install
Searching for failure / basis pass:
 127344 fail [host=godello1] / 126310 [host=albana1] 126202 [host=albana0] 126069 [host=baroque1] 125921 [host=chardonnay0] 125898 [host=chardonnay1] 125702 [host=rimava1] 125676 [host=baroque1] 125657 [host=albana0] 125648 [host=albana1] 125639 [host=italia0] 125585 ok.
Failure / basis pass flights: 127344 / 125585
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b36fdc6853a38a6f8749897a33435635019e0647 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 da3bd8111858a1fb045a6ddc0b36d72164d9c5dd
Basis pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git#6e77b267723c723d4717abc874e00059ab07a46a-b36fdc6853a38a6f8749897a33435635019e0647 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#e3f667bc5f51d0aa44357a64ca134cd952679c81-da3bd8111858a1fb045a6ddc0b36d72164d9c5dd
adhoc-revtuple-generator: tree discontiguous: linux-2.6
adhoc-revtuple-generator: tree discontiguous: qemu-xen
Loaded 2006 nodes in revision graph
Searching for test results:
 125167 [host=rimava1]
 125242 [host=debina0]
 125285 [host=huxelrebe1]
 125401 [host=joubertin1]
 125501 [host=pinot0]
 125551 [host=chardonnay1]
 125520 [host=fiano1]
 125585 pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 125648 [host=albana1]
 125639 [host=italia0]
 125657 [host=albana0]
 125676 [host=baroque1]
 125702 [host=rimava1]
 125898 [host=chardonnay1]
 125921 [host=chardonnay0]
 126069 [host=baroque1]
 126202 [host=albana0]
 126310 [host=albana1]
 126412 fail irrelevant
 126550 fail irrelevant
 126682 fail irrelevant
 126888 fail irrelevant
 126978 fail irrelevant
 127038 fail irrelevant
 127108 fail irrelevant
 127148 fail irrelevant
 127193 fail irrelevant
 127221 fail irrelevant
 127256 fail irrelevant
 127342 pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 43139135a8938de44f66333831d3a8655d07663a e5d6ddcd31a6113e4a3db7a235ca78770fe8f401
 127284 fail irrelevant
 127349 pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d3a4bb8ca03655224a440b1bfb2ff29d8cc3f2cf
 127343 pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 3ac0b20bc375cfe78eb01528f2a18ac305eff6ab
 127358 fail 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 580c458699e367bf427967844fa79086b60da675
 127351 fail 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 4737fa52ce868b51a97bd4f6ee932e040cb103bf
 127334 pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 127336 fail irrelevant
 127352 pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 fc5e7213f4f84b28c0557c8dbe16573f76932866
 127345 fail 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 5f3d3a880b74a67f283281e493be87871ca4f555
 127315 fail b36fdc6853a38a6f8749897a33435635019e0647 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 da3bd8111858a1fb045a6ddc0b36d72164d9c5dd
 127338 pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a bbafb080182c9906a5c8935ad459149340052989
 127360 pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 6425f91c72525295a551bf148d9a6b0fa7971097
 127353 pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 6425f91c72525295a551bf148d9a6b0fa7971097
 127340 fail b36fdc6853a38a6f8749897a33435635019e0647 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 da3bd8111858a1fb045a6ddc0b36d72164d9c5dd
 127348 blocked 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d704c2d6dc82522434bc358b6c19cbe420b3552d
 127355 fail 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 580c458699e367bf427967844fa79086b60da675
 127362 fail 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 580c458699e367bf427967844fa79086b60da675
 127344 fail b36fdc6853a38a6f8749897a33435635019e0647 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 da3bd8111858a1fb045a6ddc0b36d72164d9c5dd
 127356 pass 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 6425f91c72525295a551bf148d9a6b0fa7971097
Searching for interesting versions
 Result found: flight 125585 (pass), for basis pass
 Result found: flight 127315 (fail), for basis failure
 Repro found: flight 127334 (pass), for basis pass
 Repro found: flight 127340 (fail), for basis failure
 0 revisions at 6e77b267723c723d4717abc874e00059ab07a46a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 6425f91c72525295a551bf148d9a6b0fa7971097
No revisions left to test, checking graph state.
 Result found: flight 127353 (pass), for last pass
 Result found: flight 127355 (fail), for first failure
 Repro found: flight 127356 (pass), for last pass
 Repro found: flight 127358 (fail), for first failure
 Repro found: flight 127360 (pass), for last pass
 Repro found: flight 127362 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  580c458699e367bf427967844fa79086b60da675
  Bug not present: 6425f91c72525295a551bf148d9a6b0fa7971097
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127362/


  commit 580c458699e367bf427967844fa79086b60da675
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Mon Mar 19 16:50:46 2018 +0000
  
      xen/domain: Call arch_domain_create() as early as possible in domain_create()
      
      This is in preparation to set up d->max_cpus and d->vcpu[] in domain_create(),
      and allow later parts of domain construction to have access to the values.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

pnmtopng: 123 colors found
Revision graph left in /home/logs/results/bisect/linux-linus/test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
127362: tolerable ALL FAIL

flight 127362 linux-linus real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/127362/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    


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



--===============1354567546920126349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1354567546920126349==--
