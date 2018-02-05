From: osstest service owner <osstest-admin@xenproject.org>
Subject: [qemu-mainline test] 118589: regressions - trouble:
	broken/fail/pass
Date: Mon, 05 Feb 2018 22:20:43 +0000
Message-ID: <osstest-118589-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1879105753652256116=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vn6f=e7=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1eip8E-0002OL-SO
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 22:20:58 +0000
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

--===============1879105753652256116==
Content-Type: text/plain

flight 118589 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118589/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-libvirt-xsm     <job status>                 broken
 test-amd64-i386-libvirt-xsm   4 host-install(4)        broken REGR. vs. 118548
 test-armhf-armhf-xl-credit2   7 xen-boot                 fail REGR. vs. 118548
 test-amd64-amd64-xl-qemuu-ws16-amd64 16 guest-localmigrate/x10 fail REGR. vs. 118548

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 118548
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 118548
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 118548
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 118548
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 118548
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 qemuu                f24ee107a07f093bd7ed475dd48d7ba57ea3d8fe
baseline version:
 qemuu                fb2516ef94b8399ddded4a41c4346cbc1d5d98fc

Last test of basis   118548  2018-02-03 02:21:42 Z    2 days
Testing same since   118589  2018-02-05 09:49:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  BALATON Zoltan <balaton@eik.bme.hu>
  Daniel P. Berrange <berrange@redhat.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-armhf-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  broken  
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-armhf-armhf-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-xl-qemuu-win10-i386                         fail    
 test-amd64-i386-xl-qemuu-win10-i386                          fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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

broken-job test-amd64-i386-libvirt-xsm broken
broken-step test-amd64-i386-libvirt-xsm host-install(4)

Not pushing.

------------------------------------------------------------
commit f24ee107a07f093bd7ed475dd48d7ba57ea3d8fe
Merge: fb2516ef94 627ebec208
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Fri Feb 2 18:54:11 2018 +0000

    Merge remote-tracking branch 'remotes/kraxel/tags/ui-20180202-pull-request' into staging
    
    ui: use QIONetListener in vnc, bugfixes for sdl1 and vnc.
    
    # gpg: Signature made Fri 02 Feb 2018 07:17:36 GMT
    # gpg:                using RSA key 4CB6D8EED3E87138
    # gpg: Good signature from "Gerd Hoffmann (work) <kraxel@redhat.com>"
    # gpg:                 aka "Gerd Hoffmann <gerd@kraxel.org>"
    # gpg:                 aka "Gerd Hoffmann (private) <kraxel@gmail.com>"
    # Primary key fingerprint: A032 8CFF B93A 17A7 9901  FE7D 4CB6 D8EE D3E8 7138
    
    * remotes/kraxel/tags/ui-20180202-pull-request:
      ui: correctly advance output buffer when writing SASL data
      ui: convert VNC server to QIONetListener
      ui: fix mixup between qnum and qcode in SDL1 key handling
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 627ebec208a8809818589e17f4fce55a59420ad2
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Thu Feb 1 15:58:41 2018 +0000

    ui: correctly advance output buffer when writing SASL data
    
    In this previous commit:
    
      commit 8f61f1c5a6bc06438a1172efa80bc7606594fa07
      Author: Daniel P. Berrange <berrange@redhat.com>
      Date:   Mon Dec 18 19:12:20 2017 +0000
    
        ui: track how much decoded data we consumed when doing SASL encoding
    
    I attempted to fix a flaw with tracking how much data had actually been
    processed when encoding with SASL. With that flaw, the VNC server could
    mistakenly discard queued data that had not been sent.
    
    The fix was not quite right though, because it merely decremented the
    vs->output.offset value. This is effectively discarding data from the
    end of the pending output buffer. We actually need to discard data from
    the start of the pending output buffer. We also want to free memory that
    is no longer required. The correct way to handle this is to use the
    buffer_advance() helper method instead of directly manipulating the
    offset value.
    
    Reported-by: Laszlo Ersek <lersek@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Reviewed-by: Laszlo Ersek <lersek@redhat.com>
    Message-id: 20180201155841.27509-1-berrange@redhat.com
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

commit 13e1d0e71e78a925848258391a6e616b6b5ae219
Author: Daniel P. Berrange <berrange@redhat.com>
Date:   Thu Feb 1 16:45:14 2018 +0000

    ui: convert VNC server to QIONetListener
    
    The VNC server already has the ability to listen on multiple sockets.
    Converting it to use the QIONetListener APIs though, will reduce the
    amount of code in the VNC server and improve the clarity of what is
    left.
    
    Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
    Message-id: 20180201164514.10330-1-berrange@redhat.com
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

commit 8ea9c80a19da93e93852ab61434b1a33fcbaa97a
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Thu Feb 1 18:00:33 2018 +0000

    ui: fix mixup between qnum and qcode in SDL1 key handling
    
    The previous commit:
    
      commit 2ec78706d188df7d3dab43d07b19b05ef7800a44
      Author: Daniel P. Berrange <berrange@redhat.com>
      Date:   Wed Jan 17 16:47:15 2018 +0000
    
        ui: convert GTK and SDL1 frontends to keycodemapdb
    
    changed the x_keymap.c keymap so that its target was qcodes instead of
    qnums. It updated the GTK frontend to take account of this change, but
    forgot to update the SDL1 frontend. Thus the SDL frontend was getting
    qcodes but dispatching them as if they were qnums. IOW, keyboard input
    was completely hosed with SDL1. Since the keyboard layout tables are
    still all based on qnums, it is easier to just keep SDL1 using qnums as
    it will be deleted in a few releases time.
    
    Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
    Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
    Message-id: 20180201180033.14255-1-berrange@redhat.com
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>


--===============1879105753652256116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1879105753652256116==--
