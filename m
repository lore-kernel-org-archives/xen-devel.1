From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-coverity test] 119806: regressions - ALL
	FAIL
Date: Wed, 21 Feb 2018 10:25:22 +0000
Message-ID: <osstest-119806-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1176030737482314769=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=foxx=fp=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1eoRah-0004ME-2w
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2018 10:25:35 +0000
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

--===============1176030737482314769==
Content-Type: text/plain

flight 119806 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/119806/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 coverity-amd64                7 coverity-upload          fail REGR. vs. 119558

version targeted for testing:
 xen                  23b40df6f098e3bcb2f105a4909860240976e40f
baseline version:
 xen                  24470b99c1671dca531c2cf5747eda2f8892ecbc

Last test of basis   119558  2018-02-18 09:47:32 Z    3 days
Testing same since   119806  2018-02-21 09:29:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexandru Isaila <aisaila@bitdefender.com>
  Andrew Cooper <andrew.cooper3@citix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <julien.grall@arm.com>
  Razvan Cojocaru <rcojocaru@bitdefender.com>
  Sergey Dyasli <sergey.dyasli@citrix.com>
  Wei Liu <wei.liu2@citrix.com>

jobs:
 coverity-amd64                                               fail    


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


Not pushing.

------------------------------------------------------------
commit 23b40df6f098e3bcb2f105a4909860240976e40f
Author: Julien Grall <julien.grall@arm.com>
Date:   Fri Feb 16 14:59:56 2018 +0000

    xen/arm: vgic: Make sure the number of SPIs is a multiple of 32
    
    The vGIC relies on having a pending_irq available for every IRQs
    described in the ranks. As each rank describes 32 interrupts, we need to
    make sure the number of SPIs is a multiple of 32.
    
    Reported-by: Jeff Kubascik <Jeff.Kubascik@dornerworks.com>
    Signed-off-by: Julien Grall <julien.grall@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Cc: Jarvis Roach <Jarvis.Roach@dornerworks.com>

commit 454ae490487659a51d71adc77aa02892d0725235
Author: Alexandru Isaila <aisaila@bitdefender.com>
Date:   Mon Feb 19 15:07:06 2018 +0200

    asm-x86/monitor: Add MONITOR_EVENT_INTERRUPT to common capabilities
    
    Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>
    Acked-by: Razvan Cojocaru <rcojocaru@bitdefender.com>

commit 197fbdb501257fdbbe0cfed35e3a99ef5b166107
Author: Sergey Dyasli <sergey.dyasli@citrix.com>
Date:   Mon Feb 19 11:29:26 2018 +0000

    x86/msr: add Raw and Host domain policies
    
    Raw policy contains the actual values from H/W MSRs. Add PLATFORM_INFO
    msr to the policy during probe_cpuid_faulting().
    
    Host policy may have certain features disabled if Xen decides not
    to use them. For now, make Host policy equal to Raw policy with
    cpuid_faulting availability dependent on X86_FEATURE_CPUID_FAULTING.
    
    Finally, derive HVM/PV max domain policies from the Host policy.
    
    Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit a44f1697968e04fcc6145e3bd51c748b57047240
Author: Igor Druzhinin <igor.druzhinin@citrix.com>
Date:   Tue Feb 20 10:16:56 2018 +0100

    x86/nmi: start NMI watchdog on CPU0 after SMP bootstrap
    
    We're noticing a reproducible system boot hang on certain
    Skylake platforms where the BIOS is configured in legacy
    boot mode with x2APIC disabled. The system stalls immediately
    after writing the first SMP initialization sequence into APIC ICR.
    
    The cause of the problem is watchdog NMI handler execution -
    somewhere near the end of NMI handling (after it's already
    rescheduled the next NMI) it tries to access IO port 0x61
    to get the actual NMI reason on CPU0. Unfortunately, this
    port is emulated by BIOS using SMIs and this emulation for
    some reason takes more time than we expect during INIT-SIPI-SIPI
    sequence. As the result, the system is constantly moving between
    NMI and SMI handler and not making any progress.
    
    To avoid this, initialize the watchdog after SMP bootstrap on
    CPU0 and, additionally, protect the NMI handler by moving
    IO port access before NMI re-scheduling. The latter should also
    help in case of post boot CPU onlining. Although we're running
    watchdog at much lower frequency at this point, it's neveretheless
    possible we may trigger the issue anyway.
    
    Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 682b13c259e531f6848f535032c256ec8fcaca71
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Feb 20 10:10:59 2018 +0100

    shim: allow building of just the shim with build-ID-incapable linker
    
    The ELF note the shim build inserts causes mkelf32 to choke on the
    second program header. However, the output of mkelf32 isn't really
    needed when building inside tools/firmware/ - an attempt to build it is
    made solely because of a wrong dependency.
    
    Further changes to the make logic will be needed to also allow building
    a shim-enabled "normal" xen with such a linker (as it looks the --notes
    option will need passing not just when the linker support build ID
    generation).
    
    Also drop a stray variable setting from the x86 Makefile.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>

commit 8f9ccfe93570ecae18d9cc224931787d0bca9c66
Author: Dario Faggioli <dfaggioli@suse.com>
Date:   Fri Feb 16 19:38:48 2018 +0100

    tools: libxenstat: fix format string overflow
    
    With gcc 7.3.0, the build fails like this:
    
    src/xenstat_linux.c: In function ‘getBridge’
    src/xenstat_linux.c:78:34: warning: ‘%s’ directive writing up to 255 bytes into a region of size 241 [-Wformat-overflow=]
         sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
                                      ^~
    src/xenstat_linux.c:78:5: note: ‘sprintf’ output between 23 and 278 bytes into a destination of size 256
         sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Fix by making the buffer bigger.
    
    Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit d3b230fc46ee9853064e167f6cb4da8ea0a08112
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Feb 19 14:00:31 2018 +0100

    shut down domain when last vCPU goes down
    
    I've just had to deal with an early boot crash of Linux which occurred
    so early that even "earlyprintk=xen" did not produce any useful output.
    Hence the domain appeared to hang, while in fact it had brought down its
    only vCPU. By translating this to a shutdown, the situation will be
    better recognizable.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 0091daa9d911995327ef92c3ce663c3c569c8c6e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Feb 19 13:59:37 2018 +0100

    x86/PV: avoid indirect call/thunk in I/O emulation
    
    The stub is within reach from the .text section, so there's no point
    using an indirect call here. This has the added benefit of there no
    longer being two sufficiently different approaches, breaking one of
    which people may not even notice.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citix.com>
(qemu changes not included)


--===============1176030737482314769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1176030737482314769==--
